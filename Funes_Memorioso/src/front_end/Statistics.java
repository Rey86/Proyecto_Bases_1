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

public class Statistics extends javax.swing.JDialog {
    JFreeChart chart;
    DefaultPieDataset dataset = new DefaultPieDataset();
    DefaultCategoryDataset data = new DefaultCategoryDataset();

    public Statistics(java.awt.Frame parent, boolean modal) {
        super(parent, modal);
        initComponents();
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

        btnTranscriptsHouseArrstXTranscriptType.setText("Expedientes con Casa por Cárcel por Tipo Expediente");
        btnTranscriptsHouseArrstXTranscriptType.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnTranscriptsHouseArrstXTranscriptTypeActionPerformed(evt);
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
                    .addComponent(btnAgeUsers))
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
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void btnTranscriptsXTypeActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnTranscriptsXTypeActionPerformed
        dataset.setValue("iPhone", 20);
        dataset.setValue("Samsung", 20);
        dataset.setValue("Motorola", 40);
        dataset.setValue("Nokia", 10);
        
        chart = ChartFactory.createPieChart("Mobile Sales", dataset, 
                true, true, false);
        
        PieSectionLabelGenerator labelGenerator = new  StandardPieSectionLabelGenerator(
            "Marks {0} : ({2})", new DecimalFormat("0"), new DecimalFormat("0%"));
        ((PiePlot) chart.getPlot()).setLabelGenerator(labelGenerator);
        
        ChartPanel Panel = new ChartPanel(chart);
        JDialog Ventana = new JDialog(new javax.swing.JFrame(), true);
        Ventana.getContentPane().add(Panel);
        Ventana.pack();
        Ventana.setVisible(true);
    }//GEN-LAST:event_btnTranscriptsXTypeActionPerformed

    private void btnTranscriptsXZoneActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnTranscriptsXZoneActionPerformed
        dataset.setValue("iPhone", 20);
        dataset.setValue("Samsung", 20);
        dataset.setValue("Motorola", 40);
        dataset.setValue("Nokia", 10);
        
        chart = ChartFactory.createPieChart("Mobile Sales", dataset, 
                true, true, false);
        
        PieSectionLabelGenerator labelGenerator = new  StandardPieSectionLabelGenerator(
            "Marks {0} : ({2})", new DecimalFormat("0"), new DecimalFormat("0%"));
        ((PiePlot) chart.getPlot()).setLabelGenerator(labelGenerator);
        
        ChartPanel Panel = new ChartPanel(chart);
        JDialog Ventana = new JDialog(new javax.swing.JFrame(), true);
        Ventana.getContentPane().add(Panel);
        Ventana.pack();
        Ventana.setVisible(true);
    }//GEN-LAST:event_btnTranscriptsXZoneActionPerformed

    private void btnAgeUsersActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnAgeUsersActionPerformed
        dataset.setValue("iPhone", 20);
        dataset.setValue("Samsung", 20);
        dataset.setValue("Motorola", 40);
        dataset.setValue("Nokia", 10);
        
        chart = ChartFactory.createPieChart("Mobile Sales", dataset, 
                true, true, false);
        
        PieSectionLabelGenerator labelGenerator = new  StandardPieSectionLabelGenerator(
            "Marks {0} : ({2})", new DecimalFormat("0"), new DecimalFormat("0%"));
        ((PiePlot) chart.getPlot()).setLabelGenerator(labelGenerator);
        
        ChartPanel Panel = new ChartPanel(chart);
        JDialog Ventana = new JDialog(new javax.swing.JFrame(), true);
        Ventana.getContentPane().add(Panel);
        Ventana.pack();
        Ventana.setVisible(true);
    }//GEN-LAST:event_btnAgeUsersActionPerformed

    private void btnAgeAccusedActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnAgeAccusedActionPerformed
        dataset.setValue("iPhone", 20);
        dataset.setValue("Samsung", 20);
        dataset.setValue("Motorola", 40);
        dataset.setValue("Nokia", 10);
        
        chart = ChartFactory.createPieChart("Mobile Sales", dataset, 
                true, true, false);
        
        PieSectionLabelGenerator labelGenerator = new  StandardPieSectionLabelGenerator(
            "Marks {0} : ({2})", new DecimalFormat("0"), new DecimalFormat("0%"));
        ((PiePlot) chart.getPlot()).setLabelGenerator(labelGenerator);
        
        ChartPanel Panel = new ChartPanel(chart);
        JDialog Ventana = new JDialog(new javax.swing.JFrame(), true);
        Ventana.getContentPane().add(Panel);
        Ventana.pack();
        Ventana.setVisible(true);
    }//GEN-LAST:event_btnAgeAccusedActionPerformed

    private void btnTranscriptsXPlaceAccusedActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnTranscriptsXPlaceAccusedActionPerformed
        dataset.setValue("iPhone", 20);
        dataset.setValue("Samsung", 20);
        dataset.setValue("Motorola", 40);
        dataset.setValue("Nokia", 10);
        
        chart = ChartFactory.createPieChart("Mobile Sales", dataset, 
                true, true, false);
        
        PieSectionLabelGenerator labelGenerator = new  StandardPieSectionLabelGenerator(
            "Marks {0} : ({2})", new DecimalFormat("0"), new DecimalFormat("0%"));
        ((PiePlot) chart.getPlot()).setLabelGenerator(labelGenerator);
        
        ChartPanel Panel = new ChartPanel(chart);
        JDialog Ventana = new JDialog(new javax.swing.JFrame(), true);
        Ventana.getContentPane().add(Panel);
        Ventana.pack();
        Ventana.setVisible(true);
    }//GEN-LAST:event_btnTranscriptsXPlaceAccusedActionPerformed

    private void btnTimeSentenceXTranscriptTypeActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnTimeSentenceXTranscriptTypeActionPerformed
        data.addValue(1, "Negocio 1", "Lunes");
        data.addValue(2, "Negocio 1", "Martes");
        data.addValue(3, "Negocio 1", "Miércoles");
        data.addValue(4, "Negocio 1", "Jueves");
        data.addValue(5, "Negocio 1", "Viernes");
        data.addValue(6, "Negocio 1", "Sábado");
        data.addValue(7, "Negocio 1", "Domingo");
        
        chart = ChartFactory.createBarChart("Visitas diarias",
                                                "Días", "Visitas", data,
                                                PlotOrientation.HORIZONTAL, 
                                                true, true, false);
        
        ChartPanel Panel = new ChartPanel(chart);
        JDialog Ventana = new JDialog(new javax.swing.JFrame(), true);
        Ventana.getContentPane().add(Panel);
        Ventana.pack();
        Ventana.setVisible(true);
    }//GEN-LAST:event_btnTimeSentenceXTranscriptTypeActionPerformed

    private void btnTranscriptsXEndDateSentenceActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnTranscriptsXEndDateSentenceActionPerformed
        data.addValue(1, "Negocio 1", "Lunes");
        data.addValue(2, "Negocio 1", "Martes");
        data.addValue(3, "Negocio 1", "Miércoles");
        data.addValue(4, "Negocio 1", "Jueves");
        data.addValue(5, "Negocio 1", "Viernes");
        data.addValue(6, "Negocio 1", "Sábado");
        data.addValue(7, "Negocio 1", "Domingo");
        
        chart = ChartFactory.createBarChart("Visitas diarias",
                                                "Días", "Visitas", data,
                                                PlotOrientation.HORIZONTAL, 
                                                true, true, false);
        
        ChartPanel Panel = new ChartPanel(chart);
        JDialog Ventana = new JDialog(new javax.swing.JFrame(), true);
        Ventana.getContentPane().add(Panel);
        Ventana.pack();
        Ventana.setVisible(true);
    }//GEN-LAST:event_btnTranscriptsXEndDateSentenceActionPerformed

    private void btnJailYearsXTranscriptTypeActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnJailYearsXTranscriptTypeActionPerformed
        data.addValue(1, "Negocio 1", "Lunes");
        data.addValue(2, "Negocio 1", "Martes");
        data.addValue(3, "Negocio 1", "Miércoles");
        data.addValue(4, "Negocio 1", "Jueves");
        data.addValue(5, "Negocio 1", "Viernes");
        data.addValue(6, "Negocio 1", "Sábado");
        data.addValue(7, "Negocio 1", "Domingo");
        
        chart = ChartFactory.createBarChart("Visitas diarias",
                                                "Días", "Visitas", data,
                                                PlotOrientation.HORIZONTAL, 
                                                true, true, false);
        
        ChartPanel Panel = new ChartPanel(chart);
        JDialog Ventana = new JDialog(new javax.swing.JFrame(), true);
        Ventana.getContentPane().add(Panel);
        Ventana.pack();
        Ventana.setVisible(true);
    }//GEN-LAST:event_btnJailYearsXTranscriptTypeActionPerformed

    private void btnTranscriptsHouseArrstXTranscriptTypeActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnTranscriptsHouseArrstXTranscriptTypeActionPerformed
        data.addValue(1, "Negocio 1", "Lunes");
        data.addValue(2, "Negocio 1", "Martes");
        data.addValue(3, "Negocio 1", "Miércoles");
        data.addValue(4, "Negocio 1", "Jueves");
        data.addValue(5, "Negocio 1", "Viernes");
        data.addValue(6, "Negocio 1", "Sábado");
        data.addValue(7, "Negocio 1", "Domingo");
        
        chart = ChartFactory.createBarChart("Visitas diarias",
                                                "Días", "Visitas", data,
                                                PlotOrientation.HORIZONTAL, 
                                                true, true, false);
        
        ChartPanel Panel = new ChartPanel(chart);
        JDialog Ventana = new JDialog(new javax.swing.JFrame(), true);
        Ventana.getContentPane().add(Panel);
        Ventana.pack();
        Ventana.setVisible(true);
    }//GEN-LAST:event_btnTranscriptsHouseArrstXTranscriptTypeActionPerformed

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
    private javax.swing.JLabel jLabel1;
    // End of variables declaration//GEN-END:variables
}
