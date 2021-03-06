package front_end;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JDialog;
import javax.swing.JOptionPane;
import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartPanel;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.labels.PieSectionLabelGenerator;
import org.jfree.chart.labels.StandardPieSectionLabelGenerator;
import org.jfree.chart.plot.PiePlot;
import org.jfree.data.general.DefaultPieDataset;

public class Statistics_TranscriptsXZone extends javax.swing.JDialog {
    JFreeChart chart;

    public Statistics_TranscriptsXZone(java.awt.Frame parent, boolean modal) {
        super(parent, modal);
        initComponents();
        initial();
        setLocationRelativeTo(null);
    }

    public void initial(){
        try{
            ResultSet d = connection_sqldb.DataBaseConnection.getDistricts();
            ResultSet ca = connection_sqldb.DataBaseConnection.getCantons();
            ResultSet p = connection_sqldb.DataBaseConnection.getProvinces();
            ResultSet co = connection_sqldb.DataBaseConnection.getCountries();
            cmbDistrict.addItem("0 Sin Filtro"); 
            cmbCanton.addItem("0 Sin Filtro"); 
            cmbProvince.addItem("0 Sin Filtro"); 
            cmbCountry.addItem("0 Sin Filtro"); 
            while(d.next()){
                cmbDistrict.addItem(String.valueOf(d.getInt("ID_DISTRICT")) + " " + d.getString("DISTRICT_NAME"));
            }
            while(ca.next()){
                cmbCanton.addItem(String.valueOf(ca.getInt("ID_CANTON")) + " " + ca.getString("CANTON_NAME"));
            }
            while(p.next()){
                cmbProvince.addItem(String.valueOf(p.getInt("ID_PROVINCE")) + " " + p.getString("PROVINCE_NAME"));
            }
            while(co.next()){
                cmbCountry.addItem(String.valueOf(co.getInt("ID_COUNTRY")) + " " + co.getString("COUNTRY_NAME"));
            }
        }
        catch (SQLException e){
            JOptionPane.showMessageDialog(this, e.toString(), "Cuidado", JOptionPane.ERROR_MESSAGE);
        }
    }

    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jLabel1 = new javax.swing.JLabel();
        jLabel2 = new javax.swing.JLabel();
        cmbCountry = new javax.swing.JComboBox<>();
        cmbProvince = new javax.swing.JComboBox<>();
        jLabel3 = new javax.swing.JLabel();
        jLabel4 = new javax.swing.JLabel();
        cmbCanton = new javax.swing.JComboBox<>();
        cmbDistrict = new javax.swing.JComboBox<>();
        btnAcceot = new javax.swing.JButton();
        btnCancel = new javax.swing.JButton();

        setDefaultCloseOperation(javax.swing.WindowConstants.DISPOSE_ON_CLOSE);

        jLabel1.setText("País:");

        jLabel2.setText("Provincia:");

        jLabel3.setText("Cantón:");

        jLabel4.setText("Distrito:");

        btnAcceot.setText("Aceptar");
        btnAcceot.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnAcceotActionPerformed(evt);
            }
        });

        btnCancel.setText("Cancelar");
        btnCancel.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnCancelActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.CENTER)
                    .addGroup(layout.createSequentialGroup()
                        .addComponent(jLabel3)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(cmbCanton, javax.swing.GroupLayout.PREFERRED_SIZE, 100, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addGroup(layout.createSequentialGroup()
                        .addComponent(jLabel4)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(cmbDistrict, javax.swing.GroupLayout.PREFERRED_SIZE, 100, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addGroup(layout.createSequentialGroup()
                        .addComponent(btnAcceot)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(btnCancel))
                    .addGroup(layout.createSequentialGroup()
                        .addComponent(jLabel1)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(cmbCountry, javax.swing.GroupLayout.PREFERRED_SIZE, 100, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addGroup(layout.createSequentialGroup()
                        .addComponent(jLabel2)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(cmbProvince, javax.swing.GroupLayout.PREFERRED_SIZE, 100, javax.swing.GroupLayout.PREFERRED_SIZE)))
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel1)
                    .addComponent(cmbCountry, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(18, 18, 18)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel2)
                    .addComponent(cmbProvince, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(18, 18, 18)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel3)
                    .addComponent(cmbCanton, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(18, 18, 18)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel4)
                    .addComponent(cmbDistrict, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(18, 18, 18)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(btnAcceot)
                    .addComponent(btnCancel))
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void btnCancelActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnCancelActionPerformed
        dispose();
    }//GEN-LAST:event_btnCancelActionPerformed

    private void btnAcceotActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnAcceotActionPerformed
        String current_country = (String) cmbCountry.getSelectedItem();
        String current_province = (String) cmbProvince.getSelectedItem();
        String current_canton = (String) cmbCanton.getSelectedItem();
        String current_district = (String) cmbDistrict.getSelectedItem();
        Integer id_country = Integer.valueOf(current_country.split(" ")[0]);
        Integer id_province = Integer.valueOf(current_province.split(" ")[0]);
        Integer id_canton = Integer.valueOf(current_canton.split(" ")[0]);
        Integer id_district = Integer.valueOf(current_district.split(" ")[0]);
        DefaultPieDataset dataset = new DefaultPieDataset();
        try {
            ResultSet r = connection_sqldb.DataBaseConnection.getTrPercentagePerZone(id_country,id_province,id_canton,id_district);
            while(r.next()){
                dataset.setValue(r.getString("community_name"), r.getInt("percentage"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(Statistics.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        chart = ChartFactory.createPieChart("Expedientes por Zona del Crimen", dataset, 
                true, true, false);
        
        PieSectionLabelGenerator labelGenerator = new  StandardPieSectionLabelGenerator(
            "Zona {0} : ({2})", new DecimalFormat("0"), new DecimalFormat("0%"));
        ((PiePlot) chart.getPlot()).setLabelGenerator(labelGenerator);
        
        ChartPanel Panel = new ChartPanel(chart);
        JDialog Ventana = new JDialog(new javax.swing.JFrame(), true);
        Ventana.getContentPane().add(Panel);
        Ventana.pack();
        Ventana.setVisible(true);
    }//GEN-LAST:event_btnAcceotActionPerformed

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton btnAcceot;
    private javax.swing.JButton btnCancel;
    private javax.swing.JComboBox<String> cmbCanton;
    private javax.swing.JComboBox<String> cmbCountry;
    private javax.swing.JComboBox<String> cmbDistrict;
    private javax.swing.JComboBox<String> cmbProvince;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel4;
    // End of variables declaration//GEN-END:variables
}
