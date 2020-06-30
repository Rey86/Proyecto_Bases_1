package front_end;
import java.sql.ResultSet;
import javax.swing.JOptionPane;
import java.sql.SQLException;
import javax.swing.table.DefaultTableModel;

public class ListCommunity extends javax.swing.JDialog {

    public ListCommunity(java.awt.Frame parent, boolean modal){
        super(parent, modal);
        initComponents(); 
        setLocationRelativeTo(null);
    }
    
    public void CommunityList() throws SQLException{
        ResultSet r = connection_sqldb.DataBaseConnection.getCommunities();
        DefaultTableModel dtb = (DefaultTableModel) jTableCommunities.getModel();
        while(r.next()){
            dtb.addRow(new Object[]{r.getInt("ID_COMMUNITY"), r.getString("COMMUNITY_NAME")});
        }
    }
    
    public void CommunityCleanList(){
        DefaultTableModel dtb = (DefaultTableModel) jTableCommunities.getModel();
        for (int i = dtb.getRowCount()-1;i>=0;i--) dtb.removeRow(i);
    }

    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jScrollPane1 = new javax.swing.JScrollPane();
        jTable1 = new javax.swing.JTable();
        jScrollPane2 = new javax.swing.JScrollPane();
        jTableCommunities = new javax.swing.JTable();
        jLabel1 = new javax.swing.JLabel();
        jButtonClose = new javax.swing.JButton();
        jButtonList = new javax.swing.JButton();
        jButtonEdit = new javax.swing.JButton();
        jButtonInsert = new javax.swing.JButton();
        jButtonDelete = new javax.swing.JButton();

        jTable1.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {
                {null, null, null, null},
                {null, null, null, null},
                {null, null, null, null},
                {null, null, null, null}
            },
            new String [] {
                "Title 1", "Title 2", "Title 3", "Title 4"
            }
        ));
        jScrollPane1.setViewportView(jTable1);

        setDefaultCloseOperation(javax.swing.WindowConstants.DISPOSE_ON_CLOSE);

        jTableCommunities.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {

            },
            new String [] {
                "ID", "Nombre", "ID Distrito"
            }
        ) {
            Class[] types = new Class [] {
                java.lang.Integer.class, java.lang.String.class, java.lang.Integer.class
            };

            public Class getColumnClass(int columnIndex) {
                return types [columnIndex];
            }
        });
        jTableCommunities.setCursor(new java.awt.Cursor(java.awt.Cursor.DEFAULT_CURSOR));
        jScrollPane2.setViewportView(jTableCommunities);

        jLabel1.setText("Comunidades");

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

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                    .addGroup(layout.createSequentialGroup()
                        .addComponent(jLabel1)
                        .addGap(319, 319, 319))
                    .addGroup(layout.createSequentialGroup()
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                            .addComponent(jScrollPane2, javax.swing.GroupLayout.Alignment.LEADING, javax.swing.GroupLayout.PREFERRED_SIZE, 0, Short.MAX_VALUE)
                            .addGroup(layout.createSequentialGroup()
                                .addComponent(jButtonList, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                                .addComponent(jButtonEdit, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                                .addComponent(jButtonInsert, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                                .addComponent(jButtonDelete, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                                .addComponent(jButtonClose, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)))
                        .addContainerGap())))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                .addComponent(jLabel1, javax.swing.GroupLayout.PREFERRED_SIZE, 19, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jScrollPane2, javax.swing.GroupLayout.PREFERRED_SIZE, 198, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.CENTER)
                    .addComponent(jButtonClose, javax.swing.GroupLayout.DEFAULT_SIZE, 31, Short.MAX_VALUE)
                    .addComponent(jButtonList, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(jButtonEdit, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(jButtonInsert, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(jButtonDelete, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                .addContainerGap())
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void jButtonListActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButtonListActionPerformed
        try{
            CommunityCleanList();
            CommunityList();
        }
        catch (SQLException e){
            JOptionPane.showMessageDialog(this, e.toString(), "Cuidado", JOptionPane.ERROR_MESSAGE);
        }
    }//GEN-LAST:event_jButtonListActionPerformed

    private void jButtonInsertActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButtonInsertActionPerformed
        InsertCommunity dialog = new InsertCommunity(new javax.swing.JFrame(), true, null);
        dialog.setVisible(true);
        try{
            CommunityCleanList();
            CommunityList();
        }
        catch (SQLException e){
            JOptionPane.showMessageDialog(this, e.toString(), "Cuidado", JOptionPane.ERROR_MESSAGE);
        }
    }//GEN-LAST:event_jButtonInsertActionPerformed

    private void jButtonEditActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButtonEditActionPerformed
        Integer current_row = jTableCommunities.getSelectedRow();
        InsertCommunity dialog = new InsertCommunity(new javax.swing.JFrame(), true, (Integer) jTableCommunities.getValueAt(current_row, 0));
        dialog.setVisible(true);
        try{
            CommunityCleanList();
            CommunityList();
        }
        catch (SQLException e){
            JOptionPane.showMessageDialog(this, e.toString(), "Cuidado", JOptionPane.ERROR_MESSAGE);
        }
    }//GEN-LAST:event_jButtonEditActionPerformed

    private void jButtonDeleteActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButtonDeleteActionPerformed
        Integer current_row = jTableCommunities.getSelectedRow();
        try{
            connection_sqldb.DataBaseConnection.deleteCommunity((Integer) jTableCommunities.getValueAt(current_row, 0));
            CommunityCleanList();
            CommunityList();
        }
        catch (SQLException e){
            JOptionPane.showMessageDialog(this, e.toString(), "Cuidado", JOptionPane.ERROR_MESSAGE);
        }
    }//GEN-LAST:event_jButtonDeleteActionPerformed

    private void jButtonCloseActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButtonCloseActionPerformed
        dispose();
    }//GEN-LAST:event_jButtonCloseActionPerformed

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton jButtonClose;
    private javax.swing.JButton jButtonDelete;
    private javax.swing.JButton jButtonEdit;
    private javax.swing.JButton jButtonInsert;
    private javax.swing.JButton jButtonList;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JScrollPane jScrollPane2;
    private javax.swing.JTable jTable1;
    private javax.swing.JTable jTableCommunities;
    // End of variables declaration//GEN-END:variables
}
