package front_end;
import java.sql.SQLException;
import javax.swing.JOptionPane;
import java.sql.ResultSet;

public class InsertCommunity extends javax.swing.JDialog {
    private final Integer id_district;
    public InsertCommunity(java.awt.Frame parent, boolean modal, Integer id_district) {
        super(parent, modal);
        this.id_district = id_district;
        initial();
        initComponents();
        setLocationRelativeTo(null);
    }
    
    public void initial(){
        jTextFieldID.setEnabled(false);
        try{
            if(id_district != null){
                ResultSet r = connection_sqldb.DataBaseConnection.getCommunity(id_district);
                jTextFieldID.setText(r.getString("ID_COMMUNITY"));
                jTextFieldName.setText(r.getString("NAME_COMMUNITY"));
                jTextFieldIdDistrict.setText(r.getString("ID_DISTRICT"));
            }
        }
        catch (SQLException e){
            JOptionPane.showMessageDialog(this, e.toString(), "Cuidado", JOptionPane.ERROR_MESSAGE);
        }
    }
    
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jScrollBar1 = new javax.swing.JScrollBar();
        jLabel1 = new javax.swing.JLabel();
        jTextFieldID = new javax.swing.JTextField();
        jLabel2 = new javax.swing.JLabel();
        jTextFieldName = new javax.swing.JTextField();
        jLabel3 = new javax.swing.JLabel();
        jButtonAccept = new javax.swing.JButton();
        jButton2 = new javax.swing.JButton();
        jLabel4 = new javax.swing.JLabel();
        jTextFieldIdDistrict = new javax.swing.JTextField();

        setDefaultCloseOperation(javax.swing.WindowConstants.DISPOSE_ON_CLOSE);

        jLabel1.setText("ID: ");

        jLabel2.setText("Nombre: ");

        jLabel3.setText("Comunidad");

        jButtonAccept.setText("Aceptar");
        jButtonAccept.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButtonAcceptActionPerformed(evt);
            }
        });

        jButton2.setText("Cancelar");

        jLabel4.setText("ID Distrito:");

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(layout.createSequentialGroup()
                        .addContainerGap()
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(jLabel1)
                            .addComponent(jLabel2)
                            .addComponent(jLabel4))
                        .addGap(19, 19, 19)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(jTextFieldIdDistrict)
                            .addComponent(jTextFieldName)
                            .addComponent(jTextFieldID)))
                    .addGroup(layout.createSequentialGroup()
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addGroup(layout.createSequentialGroup()
                                .addGap(10, 10, 10)
                                .addComponent(jButtonAccept)
                                .addGap(18, 18, 18)
                                .addComponent(jButton2))
                            .addGroup(layout.createSequentialGroup()
                                .addGap(10, 10, 10)
                                .addComponent(jLabel3)))
                        .addGap(0, 0, Short.MAX_VALUE)))
                .addContainerGap())
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jLabel3)
                .addGap(13, 13, 13)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel1)
                    .addComponent(jTextFieldID, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel2)
                    .addComponent(jTextFieldName, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 9, Short.MAX_VALUE)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel4)
                    .addComponent(jTextFieldIdDistrict, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(18, 18, 18)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jButtonAccept)
                    .addComponent(jButton2))
                .addContainerGap())
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void jButtonAcceptActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButtonAcceptActionPerformed
        try{
            if(id_district == null){
                connection_sqldb.DataBaseConnection.insertCommunity(jButtonAccept.getText(), Integer.valueOf(jTextFieldIdDistrict.getText())); 
            } else {
                connection_sqldb.DataBaseConnection.setCommunity(Integer.valueOf(jTextFieldID.getText()), 
                    jTextFieldName.getText(), Integer.valueOf(jTextFieldIdDistrict.getText()));
            }
        }
        catch (SQLException e){
            JOptionPane.showMessageDialog(this, e.toString(), "Cuidado", JOptionPane.ERROR_MESSAGE);
        }
        dispose();
    }//GEN-LAST:event_jButtonAcceptActionPerformed

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton jButton2;
    private javax.swing.JButton jButtonAccept;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JScrollBar jScrollBar1;
    private javax.swing.JTextField jTextFieldID;
    private javax.swing.JTextField jTextFieldIdDistrict;
    private javax.swing.JTextField jTextFieldName;
    // End of variables declaration//GEN-END:variables
}
