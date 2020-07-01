package front_end;
import java.sql.ResultSet;
import javax.swing.JOptionPane;
import java.sql.SQLException;
import javax.swing.table.DefaultTableModel;

public class Expedientes extends javax.swing.JDialog {

    public Expedientes(java.awt.Frame parent, boolean modal) {
        super(parent, modal);
        initComponents();
        setLocationRelativeTo(null);
        try{
            TranscriptList();
        }
        catch (SQLException e){
            JOptionPane.showMessageDialog(this, e.toString(), "Cuidado", JOptionPane.ERROR_MESSAGE);
        }
    }
    
    public void TranscriptList() throws SQLException{
        ResultSet r = connection_sqldb.DataBaseConnection.getTranscripts();
        DefaultTableModel dtb = (DefaultTableModel) jTableTranscripts.getModel();
        while(r.next()){
            dtb.addRow(new Object[]{r.getString("TRANSCRIPT_NUMBER"), r.getString("USERNAME"),
                r.getString("ACCUSED_NAME"), r.getString("TRANSCRIPTTYPE_NAME"), r.getString("VERDICT_NAME"), 
                r.getString("COMMUNITY_NAME"), r.getString("SENTENCE_TIME"), r.getString("CRIME_DATE"), 
                r.getString("DUE_DATE")});
        }
    }
    
    public void TranscriptCleanList(){
        DefaultTableModel dtb = (DefaultTableModel) jTableTranscripts.getModel();
        for (int i = dtb.getRowCount()-1;i>=0;i--) dtb.removeRow(i);
    }

    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        btnCancelar2 = new javax.swing.JButton();
        tblLugares = new javax.swing.JScrollPane();
        jTableTranscripts = new javax.swing.JTable();
        jLabel1 = new javax.swing.JLabel();
        jButtonInsert = new javax.swing.JButton();
        jButtonEdit = new javax.swing.JButton();
        jButtonDelete = new javax.swing.JButton();

        setDefaultCloseOperation(javax.swing.WindowConstants.DISPOSE_ON_CLOSE);

        btnCancelar2.setText("Cancelar");
        btnCancelar2.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnCancelar2ActionPerformed(evt);
            }
        });

        jTableTranscripts.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {

            },
            new String [] {
                "Número", "Usuario", "Acusado", "Tipo", "Veredicto", "Comunidad", "Tiempo Sentencia", "Fecha crimen", "Fecha de vencimiento"
            }
        ) {
            Class[] types = new Class [] {
                java.lang.String.class, java.lang.String.class, java.lang.String.class, java.lang.String.class, java.lang.String.class, java.lang.String.class, java.lang.String.class, java.lang.Object.class, java.lang.String.class
            };

            public Class getColumnClass(int columnIndex) {
                return types [columnIndex];
            }
        });
        tblLugares.setViewportView(jTableTranscripts);

        jLabel1.setText("Expedientes");

        jButtonInsert.setText("Insertar");
        jButtonInsert.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButtonInsertActionPerformed(evt);
            }
        });

        jButtonEdit.setText("Editar");
        jButtonEdit.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButtonEditActionPerformed(evt);
            }
        });

        jButtonDelete.setText("Eliminar");
        jButtonDelete.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButtonDeleteActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(tblLugares, javax.swing.GroupLayout.DEFAULT_SIZE, 1051, Short.MAX_VALUE)
                    .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                        .addComponent(jButtonInsert)
                        .addGap(18, 18, 18)
                        .addComponent(jButtonEdit)
                        .addGap(18, 18, 18)
                        .addComponent(jButtonDelete)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                        .addComponent(btnCancelar2))
                    .addGroup(layout.createSequentialGroup()
                        .addComponent(jLabel1)
                        .addGap(0, 0, Short.MAX_VALUE)))
                .addContainerGap())
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jLabel1)
                .addGap(14, 14, 14)
                .addComponent(tblLugares, javax.swing.GroupLayout.PREFERRED_SIZE, 271, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(btnCancelar2)
                    .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                        .addComponent(jButtonInsert)
                        .addComponent(jButtonEdit)
                        .addComponent(jButtonDelete)))
                .addContainerGap())
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void btnCancelar2ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnCancelar2ActionPerformed
        dispose();
    }//GEN-LAST:event_btnCancelar2ActionPerformed

    private void jButtonInsertActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButtonInsertActionPerformed
        crearExpediente dialog = new crearExpediente(new javax.swing.JFrame(), true, "");
        dialog.setVisible(true);
        try{
            TranscriptList();
            TranscriptCleanList();
        }
        catch (SQLException e){
            JOptionPane.showMessageDialog(this, e.toString(), "Cuidado", JOptionPane.ERROR_MESSAGE);
        }
    }//GEN-LAST:event_jButtonInsertActionPerformed

    private void jButtonEditActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButtonEditActionPerformed
        Integer current_row = jTableTranscripts.getSelectedRow();
        if(current_row != -1){
            crearExpediente dialog = new crearExpediente(new javax.swing.JFrame(), true, String.valueOf(jTableTranscripts.getValueAt(current_row, 0)));
            dialog.setVisible(true);
            try{
                TranscriptList();
                TranscriptCleanList();
            }
            catch (SQLException e){
                JOptionPane.showMessageDialog(this, e.toString(), "Cuidado", JOptionPane.ERROR_MESSAGE);
            }
        } else {
            JOptionPane.showMessageDialog(this, "Seleccione un valor a editar", "Cuidado", JOptionPane.WARNING_MESSAGE);
        }
    }//GEN-LAST:event_jButtonEditActionPerformed

    private void jButtonDeleteActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButtonDeleteActionPerformed
        Integer current_row = jTableTranscripts.getSelectedRow();
        if(current_row != -1){
            try{
                connection_sqldb.DataBaseConnection.deleteTranscript((String) jTableTranscripts.getValueAt(current_row, 0));
                TranscriptList();
                TranscriptCleanList();
            }
            catch (SQLException e){
                JOptionPane.showMessageDialog(this, e.toString(), "Cuidado", JOptionPane.ERROR_MESSAGE);
            }
        } else {
            JOptionPane.showMessageDialog(this, "Seleccione un valor a eliminar", "Cuidado", JOptionPane.WARNING_MESSAGE);
        }
    }//GEN-LAST:event_jButtonDeleteActionPerformed


    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton btnCancelar2;
    private javax.swing.JButton jButtonDelete;
    private javax.swing.JButton jButtonEdit;
    private javax.swing.JButton jButtonInsert;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JTable jTableTranscripts;
    private javax.swing.JScrollPane tblLugares;
    // End of variables declaration//GEN-END:variables
}
