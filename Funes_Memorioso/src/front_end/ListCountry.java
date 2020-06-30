package front_end;
import java.sql.ResultSet;
import javax.swing.JOptionPane;
import java.sql.SQLException;
import javax.swing.table.DefaultTableModel;

public class ListCountry extends javax.swing.JDialog {

    public ListCountry(java.awt.Frame parent, boolean modal) {
        super(parent, modal);
        initComponents();
        setLocationRelativeTo(null);
    }

    public void CountryList() throws SQLException{
        ResultSet r = connection_sqldb.DataBaseConnection.getCountries();
        DefaultTableModel dtb = (DefaultTableModel) jTableCountries.getModel();
        while(r.next()){
            dtb.addRow(new Object[]{r.getInt("ID_COUNTRY"), r.getString("COUNTRY_NAME")});
        }
    }
    
    public void CountryCleanList(){
        DefaultTableModel dtb = (DefaultTableModel) jTableCountries.getModel();
        for (int i = dtb.getRowCount()-1;i>=0;i--) dtb.removeRow(i);
    }
    
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jButtonClose = new javax.swing.JButton();
        jButtonList = new javax.swing.JButton();
        jButtonEdit = new javax.swing.JButton();
        jScrollPane2 = new javax.swing.JScrollPane();
        jTableCountries = new javax.swing.JTable();
        jButtonInsert = new javax.swing.JButton();
        jButtonDelete = new javax.swing.JButton();
        jLabel1 = new javax.swing.JLabel();

        setDefaultCloseOperation(javax.swing.WindowConstants.DISPOSE_ON_CLOSE);

        jButtonClose.setText("Salir");
        jButtonClose.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButtonCloseActionPerformed(evt);
            }
        });

        jButtonList.setText("Listar");
        jButtonList.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButtonListActionPerformed(evt);
            }
        });

        jButtonEdit.setText("Editar");
        jButtonEdit.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButtonEditActionPerformed(evt);
            }
        });

        jTableCountries.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {

            },
            new String [] {
                "ID", "Nombre"
            }
        ) {
            Class[] types = new Class [] {
                java.lang.Integer.class, java.lang.String.class
            };

            public Class getColumnClass(int columnIndex) {
                return types [columnIndex];
            }
        });
        jTableCountries.setCursor(new java.awt.Cursor(java.awt.Cursor.DEFAULT_CURSOR));
        jScrollPane2.setViewportView(jTableCountries);

        jButtonInsert.setText("Insertar");
        jButtonInsert.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButtonInsertActionPerformed(evt);
            }
        });

        jButtonDelete.setText("Eliminar");
        jButtonDelete.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButtonDeleteActionPerformed(evt);
            }
        });

        jLabel1.setText("Paises");

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jScrollPane2, javax.swing.GroupLayout.PREFERRED_SIZE, 0, Short.MAX_VALUE)
                    .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                        .addComponent(jButtonList, javax.swing.GroupLayout.DEFAULT_SIZE, 63, Short.MAX_VALUE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(jButtonEdit, javax.swing.GroupLayout.DEFAULT_SIZE, 65, Short.MAX_VALUE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(jButtonInsert, javax.swing.GroupLayout.DEFAULT_SIZE, 75, Short.MAX_VALUE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(jButtonDelete, javax.swing.GroupLayout.DEFAULT_SIZE, 77, Short.MAX_VALUE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(jButtonClose, javax.swing.GroupLayout.DEFAULT_SIZE, 60, Short.MAX_VALUE))
                    .addGroup(layout.createSequentialGroup()
                        .addComponent(jLabel1)
                        .addGap(0, 0, Short.MAX_VALUE)))
                .addContainerGap())
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                .addComponent(jLabel1, javax.swing.GroupLayout.PREFERRED_SIZE, 19, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jScrollPane2, javax.swing.GroupLayout.PREFERRED_SIZE, 198, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.CENTER)
                    .addComponent(jButtonClose, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(jButtonList, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(jButtonEdit, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(jButtonInsert, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(jButtonDelete, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                .addContainerGap())
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void jButtonCloseActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButtonCloseActionPerformed
        dispose();
    }//GEN-LAST:event_jButtonCloseActionPerformed

    private void jButtonListActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButtonListActionPerformed
        try{
            CountryCleanList();
            CountryList();
        }
        catch (SQLException e){
            JOptionPane.showMessageDialog(this, e.toString(), "Cuidado", JOptionPane.ERROR_MESSAGE);
        }
    }//GEN-LAST:event_jButtonListActionPerformed

    private void jButtonEditActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButtonEditActionPerformed
        Integer current_row = jTableCountries.getSelectedRow();
        InsertCountry dialog = new InsertCountry(new javax.swing.JFrame(), true,  Integer.parseInt(String.valueOf(jTableCountries.getValueAt(current_row, 0))));
        dialog.setVisible(true);
        try{
            CountryCleanList();
            CountryList();
        }
        catch (SQLException e){
            JOptionPane.showMessageDialog(this, e.toString(), "Cuidado", JOptionPane.ERROR_MESSAGE);
        }
    }//GEN-LAST:event_jButtonEditActionPerformed

    private void jButtonInsertActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButtonInsertActionPerformed
        InsertCountry dialog = new InsertCountry(new javax.swing.JFrame(), true, 0);
        dialog.setVisible(true);
        try{
            CountryCleanList();
            CountryList();
        }
        catch (SQLException e){
            JOptionPane.showMessageDialog(this, e.toString(), "Cuidado", JOptionPane.ERROR_MESSAGE);
        }
    }//GEN-LAST:event_jButtonInsertActionPerformed

    private void jButtonDeleteActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButtonDeleteActionPerformed
        Integer current_row = jTableCountries.getSelectedRow();
        try{
            connection_sqldb.DataBaseConnection.deleteCountry((Integer) jTableCountries.getValueAt(current_row, 0));
            CountryCleanList();
            CountryList();
        }
        catch (SQLException e){
            JOptionPane.showMessageDialog(this, e.toString(), "Cuidado", JOptionPane.ERROR_MESSAGE);
        }
    }//GEN-LAST:event_jButtonDeleteActionPerformed

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton jButtonClose;
    private javax.swing.JButton jButtonDelete;
    private javax.swing.JButton jButtonEdit;
    private javax.swing.JButton jButtonInsert;
    private javax.swing.JButton jButtonList;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JScrollPane jScrollPane2;
    private javax.swing.JTable jTableCountries;
    // End of variables declaration//GEN-END:variables
}
