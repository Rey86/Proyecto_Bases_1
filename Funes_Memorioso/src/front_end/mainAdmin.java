
package front_end;

public class mainAdmin extends javax.swing.JDialog {
    private String username;
        
    public mainAdmin(java.awt.Frame parent, boolean modal, String username) {
        super(parent, modal);
        initComponents();
        this.username = username;
        setLocationRelativeTo(null);
    }

    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        btnCrearExpediente = new javax.swing.JButton();
        btnEditarUsuarios = new javax.swing.JButton();
        btnSalir = new javax.swing.JButton();
        btnConsultas1 = new javax.swing.JButton();
        btnEditarExpedientes = new javax.swing.JButton();
        btnEditarCatalogos = new javax.swing.JButton();
        jLabel1 = new javax.swing.JLabel();

        setDefaultCloseOperation(javax.swing.WindowConstants.DISPOSE_ON_CLOSE);

        btnCrearExpediente.setText("Crear expediente");
        btnCrearExpediente.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnCrearExpedienteActionPerformed(evt);
            }
        });

        btnEditarUsuarios.setText("Editar Usuarios");

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

        btnEditarExpedientes.setText("Editar Expedientes");

        btnEditarCatalogos.setText("Editar Catálogos");
        btnEditarCatalogos.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnEditarCatalogosActionPerformed(evt);
            }
        });

        jLabel1.setText("Menu Administradores");

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                .addContainerGap(42, Short.MAX_VALUE)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.CENTER)
                    .addComponent(btnEditarUsuarios)
                    .addComponent(btnSalir)
                    .addComponent(btnConsultas1)
                    .addComponent(btnEditarExpedientes)
                    .addComponent(btnEditarCatalogos)
                    .addComponent(btnCrearExpediente)
                    .addComponent(jLabel1))
                .addGap(40, 40, 40))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGap(8, 8, 8)
                .addComponent(jLabel1)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addComponent(btnCrearExpediente, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(btnEditarExpedientes, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(btnEditarUsuarios, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(btnConsultas1, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addGap(7, 7, 7)
                .addComponent(btnEditarCatalogos, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(btnSalir, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addContainerGap())
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void btnCrearExpedienteActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnCrearExpedienteActionPerformed
        Expedientes dialog = new Expedientes(new javax.swing.JFrame(), true);
        dialog.setVisible(true);
    }//GEN-LAST:event_btnCrearExpedienteActionPerformed

    private void btnConsultas1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnConsultas1ActionPerformed
        consultasAdmin dialog = new consultasAdmin(new javax.swing.JFrame(), true);
        dialog.setVisible(true);
    }//GEN-LAST:event_btnConsultas1ActionPerformed

    private void btnSalirActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnSalirActionPerformed
        dispose();
    }//GEN-LAST:event_btnSalirActionPerformed

    private void btnEditarCatalogosActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnEditarCatalogosActionPerformed
        editarCatalogos dialog = new editarCatalogos(new javax.swing.JFrame(), true);
        dialog.setVisible(true);
    }//GEN-LAST:event_btnEditarCatalogosActionPerformed

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton btnConsultas1;
    private javax.swing.JButton btnCrearExpediente;
    private javax.swing.JButton btnEditarCatalogos;
    private javax.swing.JButton btnEditarExpedientes;
    private javax.swing.JButton btnEditarUsuarios;
    private javax.swing.JButton btnSalir;
    private javax.swing.JLabel jLabel1;
    // End of variables declaration//GEN-END:variables
}
