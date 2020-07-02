package front_end;

import java.text.DecimalFormat;
import javax.swing.JDialog;
import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartPanel;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.labels.PieSectionLabelGenerator;
import org.jfree.chart.labels.StandardPieSectionLabelGenerator;
import org.jfree.chart.plot.PiePlot;
import org.jfree.data.general.DefaultPieDataset;
import org.jfree.data.category.DefaultCategoryDataset;
import org.jfree.chart.plot.PlotOrientation;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Statistics extends javax.swing.JDialog {
    JFreeChart chart;

    public Statistics(java.awt.Frame parent, boolean modal) {
        super(parent, modal);
        initComponents();
        setLocationRelativeTo(null);
    }

    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        btnTranscriptsXType = new javax.swing.JButton();
        jLabel1 = new javax.swing.JLabel();
        btnTranscriptsXZone = new javax.swing.JButton();
        btnAgeUsers = new javax.swing.JButton();
        btnAgeAccused = new javax.swing.JButton();
        btnTranscriptsXPlaceAccused = new javax.swing.JButton();
        btnTimeSentenceXTranscriptType = new javax.swing.JButton();
        btnTranscriptsXEndDateSentence = new javax.swing.JButton();
        btnJailYearsXTranscriptType = new javax.swing.JButton();
        btnTranscriptsHouseArrstXTranscriptType = new javax.swing.JButton();
        jButtonClose = new javax.swing.JButton();

        setDefaultCloseOperation(javax.swing.WindowConstants.DISPOSE_ON_CLOSE);

        btnTranscriptsXType.setText("Expedientes por Clasificación");
        btnTranscriptsXType.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnTranscriptsXTypeActionPerformed(evt);
            }
        });

        jLabel1.setText("Estadísticas");

        btnTranscriptsXZone.setText("Expedientes por Zona del Crimen");
        btnTranscriptsXZone.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnTranscriptsXZoneActionPerformed(evt);
            }
        });

        btnAgeUsers.setText("Edades de Usuarios");
        btnAgeUsers.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnAgeUsersActionPerformed(evt);
            }
        });

        btnAgeAccused.setText("Edades de Acusados");
        btnAgeAccused.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnAgeAccusedActionPerformed(evt);
            }
        });

        btnTranscriptsXPlaceAccused.setText("Expedientes por Residencia del Acusado");
        btnTranscriptsXPlaceAccused.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnTranscriptsXPlaceAccusedActionPerformed(evt);
            }
        });

        btnTimeSentenceXTranscriptType.setText("Tiempo de Sentencia por Tipo de Expediente");
        btnTimeSentenceXTranscriptType.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnTimeSentenceXTranscriptTypeActionPerformed(evt);
            }
        });

        btnTranscriptsXEndDateSentence.setText("Expedientes con Condenas Vencidas o Próximas a Vencer");
        btnTranscriptsXEndDateSentence.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnTranscriptsXEndDateSentenceActionPerformed(evt);
            }
        });

        btnJailYearsXTranscriptType.setText("Años de Cárcel por Tipo de Expediente");
        btnJailYearsXTranscriptType.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnJailYearsXTranscriptTypeActionPerformed(evt);
            }
        });

        btnTranscriptsHouseArrstXTranscriptType.setText("Expedientes por Tipo Sentencia");
        btnTranscriptsHouseArrstXTranscriptType.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnTranscriptsHouseArrstXTranscriptTypeActionPerformed(evt);
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
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.CENTER)
                    .addComponent(btnAgeAccused)
                    .addComponent(btnJailYearsXTranscriptType)
                    .addComponent(btnTranscriptsXPlaceAccused)
                    .addComponent(btnTranscriptsHouseArrstXTranscriptType)
                    .addComponent(btnTimeSentenceXTranscriptType)
                    .addComponent(btnTranscriptsXEndDateSentence)
                    .addComponent(btnTranscriptsXType)
                    .addComponent(jLabel1)
                    .addComponent(btnTranscriptsXZone)
                    .addComponent(btnAgeUsers)
                    .addComponent(jButtonClose))
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jLabel1)
                .addGap(18, 18, 18)
                .addComponent(btnTranscriptsXType)
                .addGap(18, 18, 18)
                .addComponent(btnTranscriptsXZone)
                .addGap(18, 18, 18)
                .addComponent(btnAgeUsers)
                .addGap(18, 18, 18)
                .addComponent(btnAgeAccused)
                .addGap(18, 18, 18)
                .addComponent(btnTranscriptsXPlaceAccused)
                .addGap(18, 18, 18)
                .addComponent(btnTimeSentenceXTranscriptType)
                .addGap(18, 18, 18)
                .addComponent(btnTranscriptsXEndDateSentence)
                .addGap(18, 18, 18)
                .addComponent(btnJailYearsXTranscriptType)
                .addGap(18, 18, 18)
                .addComponent(btnTranscriptsHouseArrstXTranscriptType)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addComponent(jButtonClose)
                .addContainerGap())
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void btnTranscriptsXTypeActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnTranscriptsXTypeActionPerformed
        DefaultPieDataset dataset = new DefaultPieDataset();
        try {
            ResultSet r = connection_sqldb.DataBaseConnection.getTranscriptPercentagePerType();
            while(r.next()){
                dataset.setValue(r.getString("transcripttype_name"), r.getInt("percentage"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(Statistics.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        chart = ChartFactory.createPieChart("Expedientes por Clasificación", dataset, 
                true, true, false);
        
        PieSectionLabelGenerator labelGenerator = new  StandardPieSectionLabelGenerator(
            "Tipo {0} : ({2})", new DecimalFormat("0"), new DecimalFormat("0%"));
        ((PiePlot) chart.getPlot()).setLabelGenerator(labelGenerator);
        
        ChartPanel Panel = new ChartPanel(chart);
        JDialog dialog = new JDialog(new javax.swing.JFrame(), true);
        dialog.getContentPane().add(Panel);
        dialog.pack();
        dialog.setVisible(true);
    }//GEN-LAST:event_btnTranscriptsXTypeActionPerformed

    private void btnTranscriptsXZoneActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnTranscriptsXZoneActionPerformed
        Statistics_TranscriptsXZone dialog = new Statistics_TranscriptsXZone(new javax.swing.JFrame(), true);
        dialog.setVisible(true);
    }//GEN-LAST:event_btnTranscriptsXZoneActionPerformed

    private void btnAgeUsersActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnAgeUsersActionPerformed
        DefaultPieDataset dataset = new DefaultPieDataset();
        try {
            ResultSet r = connection_sqldb.DataBaseConnection.getAgeRangePercentageUsers();
            while(r.next()){
                dataset.setValue(r.getString("user_age_range"), r.getInt("percentage"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(Statistics.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        chart = ChartFactory.createPieChart("Porcentaje de Edades de Usuarios en Rangos", dataset, 
                true, true, false);
        
        PieSectionLabelGenerator labelGenerator = new  StandardPieSectionLabelGenerator(
            "{0} : ({2})", new DecimalFormat("0"), new DecimalFormat("0%"));
        ((PiePlot) chart.getPlot()).setLabelGenerator(labelGenerator);
        
        ChartPanel Panel = new ChartPanel(chart);
        JDialog dialog = new JDialog(new javax.swing.JFrame(), true);
        dialog.getContentPane().add(Panel);
        dialog.pack();
        dialog.setVisible(true);
    }//GEN-LAST:event_btnAgeUsersActionPerformed

    private void btnAgeAccusedActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnAgeAccusedActionPerformed
        DefaultPieDataset dataset = new DefaultPieDataset();
        try {
            ResultSet r = connection_sqldb.DataBaseConnection.getAgeRangePercentageAccused();
            while(r.next()){
                dataset.setValue(r.getString("accused_age_range"), r.getInt("percentage"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(Statistics.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        chart = ChartFactory.createPieChart("Porcentaje de Edades de Acusados en Rangos", dataset, 
                true, true, false);
        
        PieSectionLabelGenerator labelGenerator = new  StandardPieSectionLabelGenerator(
            "Edad {0} : ({2})", new DecimalFormat("0"), new DecimalFormat("0%"));
        ((PiePlot) chart.getPlot()).setLabelGenerator(labelGenerator);
        
        ChartPanel Panel = new ChartPanel(chart);
        JDialog dialog = new JDialog(new javax.swing.JFrame(), true);
        dialog.getContentPane().add(Panel);
        dialog.pack();
        dialog.setVisible(true);
    }//GEN-LAST:event_btnAgeAccusedActionPerformed

    private void btnTranscriptsXPlaceAccusedActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnTranscriptsXPlaceAccusedActionPerformed
        Statistics_TranscriptsXPlaceAccused dialog = new Statistics_TranscriptsXPlaceAccused(new javax.swing.JFrame(), true);
        dialog.setVisible(true);
    }//GEN-LAST:event_btnTranscriptsXPlaceAccusedActionPerformed

    private void btnTimeSentenceXTranscriptTypeActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnTimeSentenceXTranscriptTypeActionPerformed
        DefaultCategoryDataset data = new DefaultCategoryDataset();
        try {
            ResultSet r = connection_sqldb.DataBaseConnection.getSentenceTimePerType();
            while(r.next()){
                data.addValue(r.getInt("sentence_time"), "Años", r.getString("transcripttype_name"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(Statistics.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        chart = ChartFactory.createBarChart("Tiempo de Sentencia por Tipo de Expediente",
                                                "Tipo", "Promedio", data,
                                                PlotOrientation.HORIZONTAL, 
                                                true, true, false);
        
        ChartPanel Panel = new ChartPanel(chart);
        JDialog dialog = new JDialog(new javax.swing.JFrame(), true);
        dialog.getContentPane().add(Panel);
        dialog.pack();
        dialog.setVisible(true);
    }//GEN-LAST:event_btnTimeSentenceXTranscriptTypeActionPerformed

    private void btnTranscriptsXEndDateSentenceActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnTranscriptsXEndDateSentenceActionPerformed
        DefaultCategoryDataset data = new DefaultCategoryDataset();
        try {
            ResultSet r = connection_sqldb.DataBaseConnection.getDueSentenceTranscripts();
            while(r.next()){
                data.addValue(r.getInt("QUANTITY_TRANSCRIPTS"), "Vencidas", r.getString("transcripttype_name"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(Statistics.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        chart = ChartFactory.createBarChart("Expedientes con Condenas Vencidas o Próximas a Vencer",
                                                "Expedientes", "", data,
                                                PlotOrientation.HORIZONTAL, 
                                                true, true, false);
        
        ChartPanel Panel = new ChartPanel(chart);
        JDialog dialog = new JDialog(new javax.swing.JFrame(), true);
        dialog.getContentPane().add(Panel);
        dialog.pack();
        dialog.setVisible(true);
    }//GEN-LAST:event_btnTranscriptsXEndDateSentenceActionPerformed

    private void btnJailYearsXTranscriptTypeActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnJailYearsXTranscriptTypeActionPerformed
        DefaultCategoryDataset data = new DefaultCategoryDataset();
        try {
            ResultSet r = connection_sqldb.DataBaseConnection.getAverageSentenceTimePerType();
            while(r.next()){
                data.addValue(r.getInt("AVERAGE"), "Años de sencentia", r.getString("transcripttype_name"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(Statistics.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        chart = ChartFactory.createBarChart("Años de Cárcel por Tipo de Expediente",
                                                "Tipo", "Años", data,
                                                PlotOrientation.HORIZONTAL, 
                                                true, true, false);
        
        ChartPanel Panel = new ChartPanel(chart);
        JDialog dialog = new JDialog(new javax.swing.JFrame(), true);
        dialog.getContentPane().add(Panel);
        dialog.pack();
        dialog.setVisible(true);
    }//GEN-LAST:event_btnJailYearsXTranscriptTypeActionPerformed

    private void btnTranscriptsHouseArrstXTranscriptTypeActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnTranscriptsHouseArrstXTranscriptTypeActionPerformed
        DefaultCategoryDataset data = new DefaultCategoryDataset();
        try {
            ResultSet r = connection_sqldb.DataBaseConnection.getSentenceTypePerType();
            while(r.next()){
                data.addValue(r.getInt("QUANTITY_TRANSCRIPTS"), "Expedientes", r.getString("sentencetype_name"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(Statistics.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        chart = ChartFactory.createBarChart("Expedientes Tipo Sentencia",
                                                "Tipos", "", data,
                                                PlotOrientation.HORIZONTAL, 
                                                true, true, false);
        
        ChartPanel Panel = new ChartPanel(chart);
        JDialog dialog = new JDialog(new javax.swing.JFrame(), true);
        dialog.getContentPane().add(Panel);
        dialog.pack();
        dialog.setVisible(true);
    }//GEN-LAST:event_btnTranscriptsHouseArrstXTranscriptTypeActionPerformed

    private void jButtonCloseActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButtonCloseActionPerformed
        dispose();
    }//GEN-LAST:event_jButtonCloseActionPerformed

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton btnAgeAccused;
    private javax.swing.JButton btnAgeUsers;
    private javax.swing.JButton btnJailYearsXTranscriptType;
    private javax.swing.JButton btnTimeSentenceXTranscriptType;
    private javax.swing.JButton btnTranscriptsHouseArrstXTranscriptType;
    private javax.swing.JButton btnTranscriptsXEndDateSentence;
    private javax.swing.JButton btnTranscriptsXPlaceAccused;
    private javax.swing.JButton btnTranscriptsXType;
    private javax.swing.JButton btnTranscriptsXZone;
    private javax.swing.JButton jButtonClose;
    private javax.swing.JLabel jLabel1;
    // End of variables declaration//GEN-END:variables
}
