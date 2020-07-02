
package front_end;

public class mainUsuario extends javax.swing.JDialog {
    private String username;
     
    public mainUsuario(java.awt.Frame parent, boolean modal, String username) {
        super(parent, modal);
        initComponents();
        this.username = username;
        setLocationRelativeTo(null);
    }


    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        btnCrearExpediente = new javax.swing.JButton();
        btnEditarDatos = new javax.swing.JButton();
        btnSalir = new javax.swing.JButton();
        btnConsultas1 = new javax.swing.JButton();
        jLabel1 = new javax.swing.JLabel();

        setDefaultCloseOperation(javax.swing.WindowConstants.DISPOSE_ON_CLOSE);

        btnCrearExpediente.setText("Crear expediente");
        btnCrearExpediente.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnCrearExpedienteActionPerformed(evt);
            }
        });

        btnEditarDatos.setText("Editar Datos");
        btnEditarDatos.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnEditarDatosActionPerformed(evt);
            }
        });

        btnSalir.setText("Salir");
        btnSalir.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnSalirActionPerformed(evt);
            }
        });

        btnConsultas1.setText("Consultas");
        btnConsultas1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnConsultas1ActionPerformed(evt);
            }
        });

        jLabel1.setText("Menú Usuario");

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.CENTER)
                    .addComponent(btnCrearExpediente)
                    .addComponent(btnEditarDatos)
                    .addComponent(btnConsultas1)
                    .addComponent(btnSalir)
                    .addComponent(jLabel1))
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGap(18, 18, 18)
                .addComponent(jLabel1)
                .addGap(18, 18, 18)
                .addComponent(btnCrearExpediente)
                .addGap(18, 18, 18)
                .addComponent(btnEditarDatos)
                .addGap(18, 18, 18)
                .addComponent(btnConsultas1)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 15, Short.MAX_VALUE)
                .addComponent(btnSalir)
                .addContainerGap())
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void btnCrearExpedienteActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnCrearExpedienteActionPerformed
        Expedientes dialog = new Expedientes(new javax.swing.JFrame(), true, username);
        dialog.setVisible(true);
    }//GEN-LAST:event_btnCrearExpedienteActionPerformed

    private void btnConsultas1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnConsultas1ActionPerformed
        consultasUsuario dialog = new consultasUsuario(new javax.swing.JFrame(), true);
        dialog.setVisible(true);
    }//GEN-LAST:event_btnConsultas1ActionPerformed

    private void btnSalirActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnSalirActionPerformed
        dispose();
    }//GEN-LAST:event_btnSalirActionPerformed

    private void btnEditarDatosActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnEditarDatosActionPerformed
        Registrar dialog = new Registrar(new javax.swing.JFrame(), true, username);
        dialog.setVisible(true);
    }//GEN-LAST:event_btnEditarDatosActionPerformed


    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton btnConsultas1;
    private javax.swing.JButton btnCrearExpediente;
    private javax.swing.JButton btnEditarDatos;
    private javax.swing.JButton btnSalir;
    private javax.swing.JLabel jLabel1;
    // End of variables declaration//GEN-END:variables
}
