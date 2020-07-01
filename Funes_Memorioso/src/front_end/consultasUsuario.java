/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package front_end;

/**
 *
 * @author Familia
 */
public class consultasUsuario extends javax.swing.JDialog {

    /**
     * Creates new form consultasUsuario
     */
    public consultasUsuario(java.awt.Frame parent, boolean modal) {
        super(parent, modal);
        initComponents();
        setLocationRelativeTo(null);
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        btnTopLugares = new javax.swing.JButton();
        btnListaExpedientes = new javax.swing.JButton();
        btnListaUsuarios = new javax.swing.JButton();
        btnListaUsuariosBaneados = new javax.swing.JButton();
        btnInformacionDenunciado = new javax.swing.JButton();

        setDefaultCloseOperation(javax.swing.WindowConstants.DISPOSE_ON_CLOSE);

        btnTopLugares.setText("Top de lugares");
        btnTopLugares.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnTopLugaresActionPerformed(evt);
            }
        });

        btnListaExpedientes.setText("Lista de Expedientes");
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

        btnInformacionDenunciado.setText("Información Denunciado");
        btnInformacionDenunciado.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnInformacionDenunciadoActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 9, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addComponent(btnListaExpedientes)
                        .addGap(23, 23, 23))
                    .addComponent(btnInformacionDenunciado)
                    .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                        .addComponent(btnListaUsuariosBaneados)
                        .addGroup(layout.createSequentialGroup()
                            .addGap(18, 18, 18)
                            .addComponent(btnListaUsuarios))
                        .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                            .addComponent(btnTopLugares)
                            .addGap(37, 37, 37))))
                .addContainerGap(29, Short.MAX_VALUE))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(btnTopLugares)
                .addGap(18, 18, 18)
                .addComponent(btnListaExpedientes)
                .addGap(18, 18, 18)
                .addComponent(btnListaUsuarios)
                .addGap(26, 26, 26)
                .addComponent(btnListaUsuariosBaneados)
                .addGap(18, 18, 18)
                .addComponent(btnInformacionDenunciado)
                .addContainerGap(27, Short.MAX_VALUE))
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

    private void btnInformacionDenunciadoActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnInformacionDenunciadoActionPerformed
        datosDenunciado dialog = new datosDenunciado(new javax.swing.JFrame(), true);
        dialog.setVisible(true);
    }//GEN-LAST:event_btnInformacionDenunciadoActionPerformed

    /**
     * @param args the command line arguments
     */
    public static void main(String args[]) {
        /* Set the Nimbus look and feel */
        //<editor-fold defaultstate="collapsed" desc=" Look and feel setting code (optional) ">
        /* If Nimbus (introduced in Java SE 6) is not available, stay with the default look and feel.
         * For details see http://download.oracle.com/javase/tutorial/uiswing/lookandfeel/plaf.html 
         */
        try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if ("Nimbus".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (ClassNotFoundException ex) {
            java.util.logging.Logger.getLogger(consultasUsuario.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(consultasUsuario.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(consultasUsuario.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(consultasUsuario.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>

        /* Create and display the dialog */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                consultasUsuario dialog = new consultasUsuario(new javax.swing.JFrame(), true);
                dialog.addWindowListener(new java.awt.event.WindowAdapter() {
                    @Override
                    public void windowClosing(java.awt.event.WindowEvent e) {
                        System.exit(0);
                    }
                });
                dialog.setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton btnInformacionDenunciado;
    private javax.swing.JButton btnListaExpedientes;
    private javax.swing.JButton btnListaUsuarios;
    private javax.swing.JButton btnListaUsuariosBaneados;
    private javax.swing.JButton btnTopLugares;
    // End of variables declaration//GEN-END:variables
}
