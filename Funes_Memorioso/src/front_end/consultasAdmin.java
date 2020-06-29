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
public class consultasAdmin extends javax.swing.JDialog {

    /**
     * Creates new form consultasAdmin
     */
    public consultasAdmin(java.awt.Frame parent, boolean modal) {
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
        btnListaUsuariosContrasena = new javax.swing.JButton();
        btnListaExpedientesNuevos = new javax.swing.JButton();

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

        btnInformacionDenunciado.setText("Información Denunciado");

        btnListaUsuariosContrasena.setText("Lista de Usuarios que Mantienen su Contraseña");

        btnListaExpedientesNuevos.setText("Lista de Expedientes Nuevos");

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(layout.createSequentialGroup()
                        .addGap(10, 10, 10)
                        .addComponent(btnListaExpedientesNuevos))
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
                    .addComponent(btnListaUsuariosContrasena))
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
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
                .addGap(18, 18, 18)
                .addComponent(btnListaUsuariosContrasena)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addComponent(btnListaExpedientesNuevos)
                .addContainerGap(19, Short.MAX_VALUE))
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void btnTopLugaresActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnTopLugaresActionPerformed
        TopLugares dialog = new TopLugares(new javax.swing.JFrame(), true);
        dialog.setVisible(true);
    }//GEN-LAST:event_btnTopLugaresActionPerformed

    private void btnListaExpedientesActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnListaExpedientesActionPerformed
        Expedientes dialog = new Expedientes(new javax.swing.JFrame(), true);
        dialog.setVisible(true);
    }//GEN-LAST:event_btnListaExpedientesActionPerformed

    private void btnListaUsuariosActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnListaUsuariosActionPerformed
        usuarios dialog = new usuarios(new javax.swing.JFrame(), true);
        dialog.setVisible(true);
    }//GEN-LAST:event_btnListaUsuariosActionPerformed

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
            java.util.logging.Logger.getLogger(consultasAdmin.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(consultasAdmin.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(consultasAdmin.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(consultasAdmin.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>

        /* Create and display the dialog */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                consultasAdmin dialog = new consultasAdmin(new javax.swing.JFrame(), true);
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
    private javax.swing.JButton btnListaExpedientesNuevos;
    private javax.swing.JButton btnListaUsuarios;
    private javax.swing.JButton btnListaUsuariosBaneados;
    private javax.swing.JButton btnListaUsuariosContrasena;
    private javax.swing.JButton btnTopLugares;
    // End of variables declaration//GEN-END:variables
}
