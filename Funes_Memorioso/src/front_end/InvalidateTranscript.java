package front_end;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.swing.JOptionPane;
import javax.swing.table.DefaultTableModel;

public class InvalidateTranscript extends javax.swing.JDialog {

    public InvalidateTranscript(java.awt.Frame parent, boolean modal) {
        super(parent, modal);
        initComponents();
        try{
            TranscriptList();
        }
        catch (SQLException e){
            JOptionPane.showMessageDialog(this, e.toString(), "Cuidado", JOptionPane.ERROR_MESSAGE);
        }
        setLocationRelativeTo(null);
    }
    
    public void TranscriptList() throws SQLException{
        ResultSet t = connection_sqldb.DataBaseConnection.getTranscripts();
        DefaultTableModel dtb = (DefaultTableModel) jTableTranscripts.getModel();
        while(t.next()){
            if(t.getInt("VALID") == 1){
                dtb.addRow(new Object[]{t.getString("TRANSCRIPT_NUMBER"), "Válido"});
            } else {
                dtb.addRow(new Object[]{t.getString("TRANSCRIPT_NUMBER"), "Inválido"});
            }  
        }   
    }
    public void TranscriptCleanList(){
        DefaultTableModel dtb = (DefaultTableModel) jTableTranscripts.getModel();
        for (int i = dtb.getRowCount()-1;i>=0;i--) dtb.removeRow(i);
    }

    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jLabel2 = new javax.swing.JLabel();
        jScrollPane2 = new javax.swing.JScrollPane();
        jTableTranscripts = new javax.swing.JTable();
        jButtonInvalidate = new javax.swing.JButton();
        jButtonCancel = new javax.swing.JButton();

        setDefaultCloseOperation(javax.swing.WindowConstants.DISPOSE_ON_CLOSE);

        jLabel2.setText("Transcripts a Invalidar:");

        jTableTranscripts.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {

            },
            new String [] {
                "Número de Expediente", "Validez"
            }
        ) {
            Class[] types = new Class [] {
                java.lang.String.class, java.lang.String.class
            };

            public Class getColumnClass(int columnIndex) {
                return types [columnIndex];
            }
        });
        jScrollPane2.setViewportView(jTableTranscripts);

        jButtonInvalidate.setText("Invalidar");
        jButtonInvalidate.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButtonInvalidateActionPerformed(evt);
            }
        });

        jButtonCancel.setText("Cancelar");
        jButtonCancel.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButtonCancelActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jLabel2)
                    .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING, false)
                        .addGroup(javax.swing.GroupLayout.Alignment.LEADING, layout.createSequentialGroup()
                            .addComponent(jButtonInvalidate)
                            .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                            .addComponent(jButtonCancel))
                        .addComponent(jScrollPane2, javax.swing.GroupLayout.Alignment.LEADING, javax.swing.GroupLayout.PREFERRED_SIZE, 375, javax.swing.GroupLayout.PREFERRED_SIZE)))
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jLabel2)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jScrollPane2, javax.swing.GroupLayout.PREFERRED_SIZE, 90, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jButtonInvalidate)
                    .addComponent(jButtonCancel))
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void jButtonInvalidateActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButtonInvalidateActionPerformed
            Integer current_row = jTableTranscripts.getSelectedRow();
            if(current_row != -1){
                try{
                    ResultSet t = connection_sqldb.DataBaseConnection.getTranscript((String)jTableTranscripts.getValueAt(current_row, 0));
                    while(t.next()){
                        String[] crimedate = t.getString("CRIME_DATE").split("-"); 
                        String[] startdate = t.getString("SENTENCE_STARTDATE").split("-");
                        String[] enddate = t.getString("SENTENCE_ENDDATE").split("-"); 
                        String[] duedate = t.getString("DUE_DATE").split("-");
                        System.out.println(startdate[2]+"-"+startdate[1]+"-"+startdate[0]); 
                        connection_sqldb.DataBaseConnection.setTranscript(t.getString("TRANSCRIPT_NUMBER"), 0 , t.getString("ID_ACCUSED"), 
                                t.getInt("ID_TRANSCRIPTTYPE"), t.getInt("ID_VERDICT"), t.getInt("ID_COMMUNITY"),
                                startdate[2].split(" ")[0]+"-"+startdate[1]+"-"+startdate[0], enddate[2].split(" ")[0]+"-"+enddate[1]+"-"+enddate[0], t.getInt("ID_SENTENCETYPE"), t.getString("CRIME_DESCRIPTION"),
                                crimedate[2].split(" ")[0]+"-"+crimedate[1]+"-"+crimedate[0], duedate[2].split(" ")[0]+"-"+duedate[1]+"-"+duedate[0]);
                    }
                    TranscriptCleanList();
                    TranscriptList();
                }
                catch (SQLException e){
                    JOptionPane.showMessageDialog(this, e.toString(), "Cuidado", JOptionPane.ERROR_MESSAGE);
                }
                catch (NumberFormatException nfe){
                    JOptionPane.showMessageDialog(this, "Los días de baneo deben ser un número", "Cuidado", JOptionPane.ERROR_MESSAGE);
                }
            } else {
                JOptionPane.showMessageDialog(this, "Seleccione un transcript a invalidar", "Cuidado", JOptionPane.WARNING_MESSAGE);
            }
    }//GEN-LAST:event_jButtonInvalidateActionPerformed

    private void jButtonCancelActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButtonCancelActionPerformed
        dispose();
    }//GEN-LAST:event_jButtonCancelActionPerformed

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton jButtonCancel;
    private javax.swing.JButton jButtonInvalidate;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JScrollPane jScrollPane2;
    private javax.swing.JTable jTableTranscripts;
    // End of variables declaration//GEN-END:variables
}
