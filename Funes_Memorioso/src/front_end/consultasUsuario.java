package front_end;

public class consultasUsuario extends javax.swing.JDialog {

    public consultasUsuario(java.awt.Frame parent, boolean modal) {
        super(parent, modal);
        initComponents();
        setLocationRelativeTo(null);
    }

    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        btnTopLugares = new javax.swing.JButton();
        jButtonTopSentenceType = new javax.swing.JButton();
        jButtonBanReason = new javax.swing.JButton();
        jButtonClose = new javax.swing.JButton();
        jButtonAccusedPerCompany = new javax.swing.JButton();
        jButtonTopCrimes = new javax.swing.JButton();
        btnListaExpedientes = new javax.swing.JButton();
        btnListaUsuarios = new javax.swing.JButton();
        btnListaUsuariosBaneados = new javax.swing.JButton();
        btnInformacionPVencer = new javax.swing.JButton();
        jLabel1 = new javax.swing.JLabel();

        setDefaultCloseOperation(javax.swing.WindowConstants.DISPOSE_ON_CLOSE);

        btnTopLugares.setText("Top de lugares");
        btnTopLugares.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnTopLugaresActionPerformed(evt);
            }
        });

        jButtonTopSentenceType.setText("Top Tiempo de Sentencia");

        jButtonBanReason.setText("Top Razones de Baneo");

        jButtonClose.setText("Salir");

        jButtonAccusedPerCompany.setText("Acusados Por Compañía");

        jButtonTopCrimes.setText("Top Crimenes");

        btnListaExpedientes.setText("Lista de Expedientes por tipo");
        btnListaExpedientes.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnListaExpedientesActionPerformed(evt);
            }
        });

        btnListaUsuarios.setText("Lista de Usuarios");
        btnListaUsuarios.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnListaUsuariosActionPerformed(evt);
            }
        });

        btnListaUsuariosBaneados.setText("Lista de Usuarios Baneados");
        btnListaUsuariosBaneados.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnListaUsuariosBaneadosActionPerformed(evt);
            }
        });

        btnInformacionPVencer.setText("Información Expexientes Proximos a Vencer ");
        btnInformacionPVencer.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnInformacionPVencerActionPerformed(evt);
            }
        });

        jLabel1.setText("Consultas Usuario");

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGap(17, 17, 17)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.CENTER)
                    .addComponent(btnTopLugares)
                    .addComponent(btnListaExpedientes)
                    .addComponent(btnListaUsuarios)
                    .addComponent(btnListaUsuariosBaneados)
                    .addComponent(btnInformacionPVencer)
                    .addComponent(jLabel1)
                    .addComponent(jButtonClose)
                    .addComponent(jButtonAccusedPerCompany)
                    .addComponent(jButtonTopCrimes)
                    .addComponent(jButtonTopSentenceType)
                    .addComponent(jButtonBanReason))
                .addContainerGap(17, Short.MAX_VALUE))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jLabel1)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addComponent(btnTopLugares)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addComponent(btnListaExpedientes)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addComponent(btnListaUsuarios)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addComponent(btnListaUsuariosBaneados)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addComponent(btnInformacionPVencer)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addComponent(jButtonAccusedPerCompany)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addComponent(jButtonTopCrimes)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addComponent(jButtonTopSentenceType)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addComponent(jButtonBanReason)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addComponent(jButtonClose)
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void btnTopLugaresActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnTopLugaresActionPerformed
        TopLugares dialog = new TopLugares(new javax.swing.JFrame(), true);
        dialog.setVisible(true);
    }//GEN-LAST:event_btnTopLugaresActionPerformed

    private void btnListaExpedientesActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnListaExpedientesActionPerformed

    }//GEN-LAST:event_btnListaExpedientesActionPerformed

    private void btnListaUsuariosActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnListaUsuariosActionPerformed
        usuarios dialog = new usuarios(new javax.swing.JFrame(), true);
        dialog.setVisible(true);
    }//GEN-LAST:event_btnListaUsuariosActionPerformed

    private void btnListaUsuariosBaneadosActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnListaUsuariosBaneadosActionPerformed
        usuariosBaneados dialog = new usuariosBaneados(new javax.swing.JFrame(), true);
        dialog.setVisible(true);
    }//GEN-LAST:event_btnListaUsuariosBaneadosActionPerformed

    private void btnInformacionPVencerActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnInformacionPVencerActionPerformed
        
    }//GEN-LAST:event_btnInformacionPVencerActionPerformed

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton btnInformacionPVencer;
    private javax.swing.JButton btnListaExpedientes;
    private javax.swing.JButton btnListaUsuarios;
    private javax.swing.JButton btnListaUsuariosBaneados;
    private javax.swing.JButton btnTopLugares;
    private javax.swing.JButton jButtonAccusedPerCompany;
    private javax.swing.JButton jButtonBanReason;
    private javax.swing.JButton jButtonClose;
    private javax.swing.JButton jButtonTopCrimes;
    private javax.swing.JButton jButtonTopSentenceType;
    private javax.swing.JLabel jLabel1;
    // End of variables declaration//GEN-END:variables
}
