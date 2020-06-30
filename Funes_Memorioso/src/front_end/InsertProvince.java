package front_end;
import java.sql.SQLException;
import javax.swing.JOptionPane;
import java.sql.ResultSet;
import java.util.ArrayList;

public class InsertProvince extends javax.swing.JDialog {
    private Integer id_province;
    
    public InsertProvince(java.awt.Frame parent, boolean modal, Integer id_province) {
        super(parent, modal);
        this.id_province = id_province;
        initComponents();
        initial();
        setLocationRelativeTo(null);
    }

    public void initial(){
        try{
            if(id_province > 0){
                ResultSet r = connection_sqldb.DataBaseConnection.getProvince(id_province);
                if(r.next()) {
                    jLabelID.setText(String.valueOf(r.getInt("ID_PROVINCE")));
                    jTextFieldName.setText(r.getString("PROVINCE_NAME")); 
                    jTextFieldForeignId.setText(String.valueOf(r.getInt("ID_COUNTRY"))); 
                }
            }
        }
        catch (SQLException e){
            JOptionPane.showMessageDialog(this, e.toString(), "Cuidado", JOptionPane.ERROR_MESSAGE);
        }
    }
    
    public ArrayList<Integer> allforeigns(){
        ArrayList<Integer> countries = new ArrayList<>();
        try{
            ResultSet r = connection_sqldb.DataBaseConnection.getCountries();
            while(r.next()) countries.add(r.getInt("ID_COUNTRY"));
        }
        catch (SQLException e){
            JOptionPane.showMessageDialog(this, e.toString(), "Cuidado", JOptionPane.ERROR_MESSAGE);
        }
        return countries;
    }
    
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jButtonAccept = new javax.swing.JButton();
        jButtonCancel = new javax.swing.JButton();
        jLabel1 = new javax.swing.JLabel();
        jLabel2 = new javax.swing.JLabel();
        jTextFieldName = new javax.swing.JTextField();
        jLabel3 = new javax.swing.JLabel();
        jLabelID = new javax.swing.JLabel();
        jLabel4 = new javax.swing.JLabel();
        jTextFieldForeignId = new javax.swing.JTextField();

        setDefaultCloseOperation(javax.swing.WindowConstants.DISPOSE_ON_CLOSE);

        jButtonAccept.setText("Aceptar");
        jButtonAccept.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButtonAcceptActionPerformed(evt);
            }
        });

        jButtonCancel.setText("Cancelar");
        jButtonCancel.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButtonCancelActionPerformed(evt);
            }
        });

        jLabel1.setText("ID: ");

        jLabel2.setText("Nombre: ");

        jLabel3.setText("Provincia");

        jLabel4.setText("ID País");

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
                            .addComponent(jLabel2))
                        .addGap(28, 28, 28)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(jTextFieldName)
                            .addComponent(jLabelID, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)))
                    .addGroup(layout.createSequentialGroup()
                        .addGap(10, 10, 10)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addGroup(layout.createSequentialGroup()
                                .addComponent(jButtonAccept)
                                .addGap(18, 18, 18)
                                .addComponent(jButtonCancel))
                            .addComponent(jLabel3))
                        .addGap(0, 0, Short.MAX_VALUE))
                    .addGroup(layout.createSequentialGroup()
                        .addContainerGap()
                        .addComponent(jLabel4)
                        .addGap(18, 18, 18)
                        .addComponent(jTextFieldForeignId)))
                .addContainerGap())
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jLabel3)
                .addGap(11, 11, 11)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                    .addComponent(jLabel1)
                    .addComponent(jLabelID, javax.swing.GroupLayout.PREFERRED_SIZE, 19, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(11, 11, 11)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel2)
                    .addComponent(jTextFieldName, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel4)
                    .addComponent(jTextFieldForeignId, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jButtonAccept)
                    .addComponent(jButtonCancel))
                .addContainerGap())
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void jButtonAcceptActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButtonAcceptActionPerformed
        ArrayList<Integer> countries = allforeigns();
        if (!jTextFieldName.getText().equals("")){
            if (!jTextFieldForeignId.getText().equals("")){
                try{
                    if(id_province > 0){
                        if (countries.contains(Integer.parseInt(jTextFieldForeignId.getText()))){
                            connection_sqldb.DataBaseConnection.setProvince(Integer.valueOf(jLabelID.getText()), jTextFieldName.getText(), Integer.valueOf(jTextFieldForeignId.getText()));
                            dispose();
                        } else {
                            JOptionPane.showMessageDialog(this, "El país no existe en el sistema", "Cuidado", JOptionPane.WARNING_MESSAGE);
                        }    
                    }
                    else{
                        if (countries.contains(Integer.parseInt(jTextFieldForeignId.getText()))){
                            connection_sqldb.DataBaseConnection.insertProvince(jTextFieldName.getText(), Integer.valueOf(jTextFieldForeignId.getText()));
                            dispose();
                        } else {
                            JOptionPane.showMessageDialog(this, "El país no existe en el sistema", "Cuidado", JOptionPane.WARNING_MESSAGE);
                        }     
                    }
                }
                catch (SQLException e){
                    JOptionPane.showMessageDialog(this, e.toString(), "Cuidado", JOptionPane.ERROR_MESSAGE);
                }
            }
            else {
            JOptionPane.showMessageDialog(this, "La casilla de llave foránea se encuentra vacía", "Cuidado", JOptionPane.WARNING_MESSAGE);
            }
        }
        else {
            JOptionPane.showMessageDialog(this, "La casilla de nombre se encuentra vacía", "Cuidado", JOptionPane.WARNING_MESSAGE);
        }
    }//GEN-LAST:event_jButtonAcceptActionPerformed

    private void jButtonCancelActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButtonCancelActionPerformed
        dispose();
    }//GEN-LAST:event_jButtonCancelActionPerformed

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton jButtonAccept;
    private javax.swing.JButton jButtonCancel;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JLabel jLabelID;
    private javax.swing.JTextField jTextFieldForeignId;
    private javax.swing.JTextField jTextFieldName;
    // End of variables declaration//GEN-END:variables
}
