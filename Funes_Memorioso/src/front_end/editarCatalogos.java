package front_end;

public class editarCatalogos extends javax.swing.JDialog {

    public editarCatalogos(java.awt.Frame parent, boolean modal) {
        super(parent, modal);
        initComponents();
        setLocationRelativeTo(null);
    }

    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jLabel1 = new javax.swing.JLabel();
        jButtonCommunity = new javax.swing.JButton();
        jButtonDistrict = new javax.swing.JButton();
        jButtonCanton = new javax.swing.JButton();
        jButtonProvince = new javax.swing.JButton();
        jButtonCountry = new javax.swing.JButton();
        jButtonGender = new javax.swing.JButton();
        jButtonCompany = new javax.swing.JButton();
        jButtonTranscriptType = new javax.swing.JButton();
        jButtonSentenceType = new javax.swing.JButton();
        jButtonVerdict = new javax.swing.JButton();
        jButtonBanReason = new javax.swing.JButton();
        jButtonClose = new javax.swing.JButton();

        setDefaultCloseOperation(javax.swing.WindowConstants.DISPOSE_ON_CLOSE);

        jLabel1.setText("Catálogos ");

        jButtonCommunity.setText("Comunidad");
        jButtonCommunity.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButtonCommunityActionPerformed(evt);
            }
        });

        jButtonDistrict.setText("Distrito");
        jButtonDistrict.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButtonDistrictActionPerformed(evt);
            }
        });

        jButtonCanton.setText("Cantón");
        jButtonCanton.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButtonCantonActionPerformed(evt);
            }
        });

        jButtonProvince.setText("Provincia");
        jButtonProvince.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButtonProvinceActionPerformed(evt);
            }
        });

        jButtonCountry.setText("País");
        jButtonCountry.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButtonCountryActionPerformed(evt);
            }
        });

        jButtonGender.setText("Género");
        jButtonGender.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButtonGenderActionPerformed(evt);
            }
        });

        jButtonCompany.setText("Compañía");
        jButtonCompany.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButtonCompanyActionPerformed(evt);
            }
        });

        jButtonTranscriptType.setText("Tipo Expediente");
        jButtonTranscriptType.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButtonTranscriptTypeActionPerformed(evt);
            }
        });

        jButtonSentenceType.setText("Tipo Sentencia");
        jButtonSentenceType.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButtonSentenceTypeActionPerformed(evt);
            }
        });

        jButtonVerdict.setText("Resolución");
        jButtonVerdict.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButtonVerdictActionPerformed(evt);
            }
        });

        jButtonBanReason.setText("Motivo de Baneo");
        jButtonBanReason.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButtonBanReasonActionPerformed(evt);
            }
        });

        jButtonClose.setText("Salir");
        jButtonClose.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButtonCloseActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jButtonProvince)
                    .addComponent(jButtonCountry)
                    .addComponent(jLabel1)
                    .addComponent(jButtonBanReason)
                    .addComponent(jButtonCommunity)
                    .addComponent(jButtonDistrict)
                    .addComponent(jButtonCanton))
                .addGap(18, 18, 18)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jButtonGender)
                    .addComponent(jButtonCompany)
                    .addComponent(jButtonTranscriptType)
                    .addComponent(jButtonSentenceType)
                    .addComponent(jButtonVerdict))
                .addContainerGap(21, Short.MAX_VALUE))
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addComponent(jButtonClose)
                .addContainerGap())
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jLabel1, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addGap(7, 7, 7)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jButtonCommunity, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(jButtonGender, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jButtonDistrict, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(jButtonCompany, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jButtonCanton, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(jButtonTranscriptType, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jButtonProvince, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(jButtonSentenceType, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jButtonCountry, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(jButtonVerdict, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addComponent(jButtonBanReason, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jButtonClose)
                .addGap(13, 13, 13))
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void jButtonCloseActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButtonCloseActionPerformed
        dispose();
    }//GEN-LAST:event_jButtonCloseActionPerformed

    private void jButtonCountryActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButtonCountryActionPerformed
        ListCountry dialog = new ListCountry(new javax.swing.JFrame(), true);
        dialog.setVisible(true);
    }//GEN-LAST:event_jButtonCountryActionPerformed

    private void jButtonCommunityActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButtonCommunityActionPerformed
        ListCommunity dialog = new ListCommunity(new javax.swing.JFrame(), true);
        dialog.setVisible(true);
    }//GEN-LAST:event_jButtonCommunityActionPerformed

    private void jButtonDistrictActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButtonDistrictActionPerformed
        ListDistrict dialog = new ListDistrict(new javax.swing.JFrame(), true);
        dialog.setVisible(true);
    }//GEN-LAST:event_jButtonDistrictActionPerformed

    private void jButtonCantonActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButtonCantonActionPerformed
        ListCanton dialog = new ListCanton(new javax.swing.JFrame(), true);
        dialog.setVisible(true);
    }//GEN-LAST:event_jButtonCantonActionPerformed

    private void jButtonProvinceActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButtonProvinceActionPerformed
        ListProvince dialog = new ListProvince(new javax.swing.JFrame(), true);
        dialog.setVisible(true);
    }//GEN-LAST:event_jButtonProvinceActionPerformed

    private void jButtonBanReasonActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButtonBanReasonActionPerformed
        ListBanReason dialog = new ListBanReason(new javax.swing.JFrame(), true);
        dialog.setVisible(true);
    }//GEN-LAST:event_jButtonBanReasonActionPerformed

    private void jButtonGenderActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButtonGenderActionPerformed
        ListGender dialog = new ListGender(new javax.swing.JFrame(), true);
        dialog.setVisible(true);
    }//GEN-LAST:event_jButtonGenderActionPerformed

    private void jButtonCompanyActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButtonCompanyActionPerformed
        ListCompany dialog = new ListCompany(new javax.swing.JFrame(), true);
        dialog.setVisible(true);
    }//GEN-LAST:event_jButtonCompanyActionPerformed

    private void jButtonTranscriptTypeActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButtonTranscriptTypeActionPerformed
        ListTranscriptType dialog = new ListTranscriptType(new javax.swing.JFrame(), true);
        dialog.setVisible(true);
    }//GEN-LAST:event_jButtonTranscriptTypeActionPerformed

    private void jButtonSentenceTypeActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButtonSentenceTypeActionPerformed
        ListSentenceType dialog = new ListSentenceType(new javax.swing.JFrame(), true);
        dialog.setVisible(true);
    }//GEN-LAST:event_jButtonSentenceTypeActionPerformed

    private void jButtonVerdictActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButtonVerdictActionPerformed
        ListVerdict dialog = new ListVerdict(new javax.swing.JFrame(), true);
        dialog.setVisible(true);
    }//GEN-LAST:event_jButtonVerdictActionPerformed

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton jButtonBanReason;
    private javax.swing.JButton jButtonCanton;
    private javax.swing.JButton jButtonClose;
    private javax.swing.JButton jButtonCommunity;
    private javax.swing.JButton jButtonCompany;
    private javax.swing.JButton jButtonCountry;
    private javax.swing.JButton jButtonDistrict;
    private javax.swing.JButton jButtonGender;
    private javax.swing.JButton jButtonProvince;
    private javax.swing.JButton jButtonSentenceType;
    private javax.swing.JButton jButtonTranscriptType;
    private javax.swing.JButton jButtonVerdict;
    private javax.swing.JLabel jLabel1;
    // End of variables declaration//GEN-END:variables
}
