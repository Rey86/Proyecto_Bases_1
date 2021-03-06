
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
        btnBanearUsuarios = new javax.swing.JButton();
        btnSalir = new javax.swing.JButton();
        btnConsultas1 = new javax.swing.JButton();
        btnEditarCatalogos = new javax.swing.JButton();
        jLabel1 = new javax.swing.JLabel();
        jButtonStatistics = new javax.swing.JButton();
        jButtonInvalidateTranscripts = new javax.swing.JButton();

        setDefaultCloseOperation(javax.swing.WindowConstants.DISPOSE_ON_CLOSE);

        btnCrearExpediente.setText("Crear expediente");
        btnCrearExpediente.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnCrearExpedienteActionPerformed(evt);
            }
        });

        btnBanearUsuarios.setText("Banear Usuarios");
        btnBanearUsuarios.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnBanearUsuariosActionPerformed(evt);
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

        btnEditarCatalogos.setText("Editar Catálogos");
        btnEditarCatalogos.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnEditarCatalogosActionPerformed(evt);
            }
        });

        jLabel1.setText("Menu Administradores");

        jButtonStatistics.setText("Estadísticas");
        jButtonStatistics.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButtonStatisticsActionPerformed(evt);
            }
        });

        jButtonInvalidateTranscripts.setText("Invalidar Transcripts");
        jButtonInvalidateTranscripts.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButtonInvalidateTranscriptsActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.CENTER)
                    .addComponent(btnBanearUsuarios)
                    .addComponent(btnSalir)
                    .addComponent(btnConsultas1)
                    .addComponent(btnEditarCatalogos)
                    .addComponent(btnCrearExpediente)
                    .addComponent(jLabel1)
                    .addComponent(jButtonStatistics)
                    .addComponent(jButtonInvalidateTranscripts))
                .addContainerGap())
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGap(8, 8, 8)
                .addComponent(jLabel1, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addComponent(btnCrearExpediente, javax.swing.GroupLayout.DEFAULT_SIZE, 24, Short.MAX_VALUE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(btnBanearUsuarios, javax.swing.GroupLayout.DEFAULT_SIZE, 24, Short.MAX_VALUE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(btnConsultas1, javax.swing.GroupLayout.DEFAULT_SIZE, 24, Short.MAX_VALUE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jButtonInvalidateTranscripts)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jButtonStatistics, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(btnEditarCatalogos, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(btnSalir, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addGap(5, 5, 5))
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void btnCrearExpedienteActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnCrearExpedienteActionPerformed
        Expedientes dialog = new Expedientes(new javax.swing.JFrame(), true, username);
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

    private void btnBanearUsuariosActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnBanearUsuariosActionPerformed
        BanUsers dialog = new BanUsers(new javax.swing.JFrame(), true);
        dialog.setVisible(true);
    }//GEN-LAST:event_btnBanearUsuariosActionPerformed

    private void jButtonStatisticsActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButtonStatisticsActionPerformed
        Statistics dialog = new Statistics(new javax.swing.JFrame(), true);
        dialog.setVisible(true);
    }//GEN-LAST:event_jButtonStatisticsActionPerformed

    private void jButtonInvalidateTranscriptsActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButtonInvalidateTranscriptsActionPerformed
        InvalidateTranscript dialog = new InvalidateTranscript(new javax.swing.JFrame(), true);
        dialog.setVisible(true);
    }//GEN-LAST:event_jButtonInvalidateTranscriptsActionPerformed

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton btnBanearUsuarios;
    private javax.swing.JButton btnConsultas1;
    private javax.swing.JButton btnCrearExpediente;
    private javax.swing.JButton btnEditarCatalogos;
    private javax.swing.JButton btnSalir;
    private javax.swing.JButton jButtonInvalidateTranscripts;
    private javax.swing.JButton jButtonStatistics;
    private javax.swing.JLabel jLabel1;
    // End of variables declaration//GEN-END:variables
}
