
package front_end;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.swing.JOptionPane;


public class crearExpediente extends javax.swing.JDialog {
    private String transcript_number;
    private String username;
    
    public crearExpediente(java.awt.Frame parent, boolean modal, String transcript_number, String username) {
        super(parent, modal);
        this.transcript_number = transcript_number;
        this.username = username;
        initComponents();
        initial();
        setLocationRelativeTo(null);
    }
    
    public void initial(){
        try{
            ResultSet g = connection_sqldb.DataBaseConnection.getGenders();
            ResultSet c = connection_sqldb.DataBaseConnection.getCompanies();
            ResultSet com = connection_sqldb.DataBaseConnection.getCommunities();
            ResultSet tt = connection_sqldb.DataBaseConnection.getTranscriptTypes();
            ResultSet st = connection_sqldb.DataBaseConnection.getSentenceTypes();
            ResultSet v = connection_sqldb.DataBaseConnection.getVerdicts();
            while(g.next()){
                jComboBoxGenders.addItem(String.valueOf(g.getInt("ID_GENDER")) + " " + g.getString("GENDER_NAME"));
            }
            while(c.next()){
                jComboBoxCompanies.addItem(String.valueOf(c.getInt("ID_COMPANY")) + " " + c.getString("COMPANY_NAME"));
            }
            while(com.next()){
                cmbComunidad.addItem(String.valueOf(com.getInt("ID_COMMUNITY")) + " " + com.getString("COMMUNITY_NAME"));
            }
            while(tt.next()){
                cmbTipoExpediente.addItem(String.valueOf(tt.getInt("ID_TRANSCRIPTTYPE")) + " " + tt.getString("TRANSCRIPTTYPE_NAME"));
            }
            while(st.next()){
                jComboBoxSentenceType.addItem(String.valueOf(st.getInt("ID_SENTENCETYPE")) + " " + st.getString("SENTENCETYPE_NAME"));
            }
            while(v.next()){
                jComboBoxVerdicts.addItem(String.valueOf(v.getInt("ID_VERDICT")) + " " + v.getString("VERDICT_NAME"));
            }
            if(!transcript_number.equals("")){ 
                ResultSet t = connection_sqldb.DataBaseConnection.getTranscript(transcript_number);
                if(t.next()) {
                    String[] birthdate = String.valueOf(t.getDate("BIRTHDATE")).split("-");
                    String[] duedate = String.valueOf(t.getDate("DUE_DATE")).split("-");
                    String[] startdate = String.valueOf(t.getDate("SENTENCE_STARTDATE")).split("-");
                    String[] enddate = String.valueOf(t.getDate("SENTENCE_ENDDATE")).split("-");
                    String[] crimedate = String.valueOf(t.getDate("CRIME_DATE")).split("-");
                    jTextFieldTranscriptNumber.setText(t.getString("TRANSCRIPT_NUMBER"));
                    String current_gender = t.getInt("ID_GENDER") + " " + t.getString("GENDER_NAME");
                    String current_company = t.getInt("ID_COMPANY") + " " + t.getString("COMPANY_NAME");
                    String current_community = t.getInt("ID_COMMUNITY") + " " + t.getString("COMMUNITY_NAME");
                    String current_transcriptType = t.getInt("ID_TRANSCRIPTTYPE") + " " + t.getString("TRANSCRIPTTYPE_NAME");
                    String current_sentenceType = t.getInt("ID_SENTENCETYPE") + " " + t.getString("SENTENCETYPE_NAME");
                    String current_verdict = t.getInt("ID_VERDICT") + " " + t.getString("VERDICT_NAME");
                    jTextFieldAccusedId.setText(t.getString("ID_ACCUSED")); 
                    jTextFieldBirthDate.setText(birthdate[2] + "-" + birthdate[1] + "-" + birthdate[0]); 
                    jTextFieldUsername.setText(t.getString("USERNAME"));  
                    jTextFieldName.setText(t.getString("FIRST_NAME"));
                    jTextFieldLastName.setText(t.getString("LAST_NAME"));
                    jTextFieldSecondLastName.setText(t.getString("SECOND_LAST_NAME"));
                    jTextFieldDueDate.setText(duedate[2] + "-" + duedate[1] + "-" + duedate[0]); 
                    jTextFieldDateStart.setText(startdate[2] + "-" + startdate[1] + "-" + startdate[0]); 
                    jTextFieldDateEnd.setText(enddate[2] + "-" + enddate[1] + "-" + enddate[0]);
                    jTextFieldCrimeDate.setText(crimedate[2] + "-" + crimedate[1] + "-" + crimedate[0]);
                    jTextAreaCrimeDescription.setText(t.getString("CRIME_DESCRIPTION"));
                    jComboBoxGenders.setSelectedItem(current_gender);
                    jComboBoxCompanies.setSelectedItem(current_company);
                    cmbComunidad.setSelectedItem(current_community);
                    cmbTipoExpediente.setSelectedItem(current_transcriptType);
                    jComboBoxSentenceType.setSelectedItem(current_sentenceType);
                    jComboBoxVerdicts.setSelectedItem(current_verdict);
                }
            }
            jTextFieldUsername.setEnabled(false);
        }
        catch (SQLException e){
            JOptionPane.showMessageDialog(this, e.toString(), "Cuidado", JOptionPane.ERROR_MESSAGE);
        }
    }
    
    public ArrayList<String> allforeigns(){
        ArrayList<String> persons = new ArrayList<>();
        try{
            ResultSet r = connection_sqldb.DataBaseConnection.getPersons();
            while(r.next()) persons.add(r.getString("ID_PERSON"));
        }
        catch (SQLException e){
            JOptionPane.showMessageDialog(this, e.toString(), "Cuidado", JOptionPane.ERROR_MESSAGE);
        }
        return persons;
    }
    
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jLabel1 = new javax.swing.JLabel();
        jLabel3 = new javax.swing.JLabel();
        cmbTipoExpediente = new javax.swing.JComboBox<>();
        jLabel4 = new javax.swing.JLabel();
        cmbComunidad = new javax.swing.JComboBox<>();
        jLabel5 = new javax.swing.JLabel();
        btnAceptar = new javax.swing.JButton();
        btnCancelar = new javax.swing.JButton();
        jLabel6 = new javax.swing.JLabel();
        jScrollPane1 = new javax.swing.JScrollPane();
        jTextAreaCrimeDescription = new javax.swing.JTextArea();
        jLabel8 = new javax.swing.JLabel();
        jTextFieldTranscriptNumber = new javax.swing.JTextField();
        jLabel9 = new javax.swing.JLabel();
        jLabel10 = new javax.swing.JLabel();
        jLabel11 = new javax.swing.JLabel();
        jLabel12 = new javax.swing.JLabel();
        jLabel13 = new javax.swing.JLabel();
        jLabel15 = new javax.swing.JLabel();
        jLabel16 = new javax.swing.JLabel();
        jLabel17 = new javax.swing.JLabel();
        jLabel18 = new javax.swing.JLabel();
        jLabel19 = new javax.swing.JLabel();
        jTextFieldName = new javax.swing.JTextField();
        jTextFieldAccusedId = new javax.swing.JTextField();
        jTextFieldLastName = new javax.swing.JTextField();
        jTextFieldSecondLastName = new javax.swing.JTextField();
        jLabel2 = new javax.swing.JLabel();
        jComboBoxGenders = new javax.swing.JComboBox<>();
        jComboBoxCompanies = new javax.swing.JComboBox<>();
        jTextFieldDateStart = new javax.swing.JTextField();
        jTextFieldDateEnd = new javax.swing.JTextField();
        jTextFieldCrimeDate = new javax.swing.JTextField();
        jComboBoxSentenceType = new javax.swing.JComboBox<>();
        jLabel7 = new javax.swing.JLabel();
        jTextFieldDueDate = new javax.swing.JTextField();
        jLabel14 = new javax.swing.JLabel();
        jTextFieldUsername = new javax.swing.JTextField();
        jLabel20 = new javax.swing.JLabel();
        jTextFieldBirthDate = new javax.swing.JTextField();
        jLabel21 = new javax.swing.JLabel();
        jComboBoxVerdicts = new javax.swing.JComboBox<>();

        setDefaultCloseOperation(javax.swing.WindowConstants.DISPOSE_ON_CLOSE);

        jLabel1.setText("Expediente:");

        jLabel3.setText("Seleccione el tipo de expediente:");

        jLabel4.setText("Seleccione la comunidad:");

        jLabel5.setText("Ingrese la fecha del crimen:");

        btnAceptar.setText("Aceptar");
        btnAceptar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnAceptarActionPerformed(evt);
            }
        });

        btnCancelar.setText("Cancelar");
        btnCancelar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnCancelarActionPerformed(evt);
            }
        });

        jLabel6.setText("Describa del crimen:");

        jTextAreaCrimeDescription.setColumns(20);
        jTextAreaCrimeDescription.setRows(5);
        jScrollPane1.setViewportView(jTextAreaCrimeDescription);

        jLabel8.setText("Nombre:");

        jLabel9.setText("Primer Apellido:");

        jLabel10.setText("Segundo Apellido:");

        jLabel11.setText("Compañia:");

        jLabel12.setText("Género:");

        jLabel13.setText("ID:");

        jLabel15.setText("Acusado:");

        jLabel16.setText("Número:");

        jLabel17.setText("Fecha Inicio");

        jLabel18.setText("Fecha Fin");

        jLabel19.setText("Tipo Sentencia");

        jLabel2.setText("Sentencia:");

        jLabel7.setText("Fecha Vencimiento:");

        jLabel14.setText("Usuario:");

        jLabel20.setText("Fecha de Nacimiento:");

        jLabel21.setText("Resolución:");

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                        .addComponent(jLabel10, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(jTextFieldSecondLastName, javax.swing.GroupLayout.PREFERRED_SIZE, 111, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addGroup(layout.createSequentialGroup()
                        .addComponent(jLabel15, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                        .addGap(186, 186, 186))
                    .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(jLabel16, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                            .addComponent(jLabel13, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                            .addComponent(jLabel8, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                            .addComponent(jTextFieldTranscriptNumber, javax.swing.GroupLayout.DEFAULT_SIZE, 111, Short.MAX_VALUE)
                            .addComponent(jTextFieldName)
                            .addComponent(jTextFieldAccusedId)))
                    .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addGroup(layout.createSequentialGroup()
                                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                    .addComponent(jLabel9, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                                    .addGroup(layout.createSequentialGroup()
                                        .addComponent(jLabel12, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                                        .addGap(40, 40, 40))
                                    .addGroup(layout.createSequentialGroup()
                                        .addComponent(jLabel11, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                                        .addGap(26, 26, 26)))
                                .addGap(33, 33, 33))
                            .addGroup(layout.createSequentialGroup()
                                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                    .addComponent(btnAceptar)
                                    .addComponent(jLabel14)
                                    .addComponent(jLabel7))
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)))
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                            .addComponent(jTextFieldLastName, javax.swing.GroupLayout.Alignment.TRAILING)
                            .addComponent(jComboBoxCompanies, javax.swing.GroupLayout.Alignment.TRAILING, 0, 111, Short.MAX_VALUE)
                            .addComponent(jComboBoxGenders, javax.swing.GroupLayout.Alignment.TRAILING, 0, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                            .addComponent(jTextFieldDueDate)
                            .addComponent(jTextFieldUsername)))
                    .addGroup(layout.createSequentialGroup()
                        .addComponent(jLabel1)
                        .addGap(0, 0, Short.MAX_VALUE))
                    .addGroup(layout.createSequentialGroup()
                        .addComponent(jLabel20)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                        .addComponent(jTextFieldBirthDate, javax.swing.GroupLayout.PREFERRED_SIZE, 111, javax.swing.GroupLayout.PREFERRED_SIZE)))
                .addGap(10, 10, 10)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(layout.createSequentialGroup()
                        .addComponent(jScrollPane1, javax.swing.GroupLayout.DEFAULT_SIZE, 249, Short.MAX_VALUE)
                        .addGap(29, 29, 29)
                        .addComponent(btnCancelar))
                    .addGroup(layout.createSequentialGroup()
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(jLabel17)
                            .addComponent(jLabel18)
                            .addComponent(jLabel19)
                            .addComponent(jLabel3)
                            .addComponent(jLabel4)
                            .addComponent(jLabel5)
                            .addComponent(jLabel2))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                            .addComponent(cmbTipoExpediente, javax.swing.GroupLayout.Alignment.TRAILING, 0, 100, Short.MAX_VALUE)
                            .addComponent(cmbComunidad, javax.swing.GroupLayout.Alignment.TRAILING, 0, 100, Short.MAX_VALUE)
                            .addComponent(jComboBoxSentenceType, javax.swing.GroupLayout.Alignment.TRAILING, 0, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                            .addComponent(jTextFieldDateStart, javax.swing.GroupLayout.Alignment.TRAILING)
                            .addComponent(jTextFieldDateEnd, javax.swing.GroupLayout.Alignment.TRAILING)
                            .addComponent(jTextFieldCrimeDate, javax.swing.GroupLayout.Alignment.TRAILING)))
                    .addGroup(layout.createSequentialGroup()
                        .addComponent(jLabel6)
                        .addGap(0, 0, Short.MAX_VALUE))
                    .addGroup(layout.createSequentialGroup()
                        .addComponent(jLabel21)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                        .addComponent(jComboBoxVerdicts, javax.swing.GroupLayout.PREFERRED_SIZE, 100, javax.swing.GroupLayout.PREFERRED_SIZE)))
                .addContainerGap())
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jLabel1)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(layout.createSequentialGroup()
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(jLabel16, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                            .addComponent(jTextFieldTranscriptNumber, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(jLabel15)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(jLabel13, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                        .addGap(12, 12, 12)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(jLabel20)
                            .addComponent(jTextFieldBirthDate, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(jLabel8, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                            .addComponent(jTextFieldName, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addGap(18, 18, 18)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(jLabel9, javax.swing.GroupLayout.PREFERRED_SIZE, 14, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(jTextFieldLastName, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addGap(18, 18, 18)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(jLabel10)
                            .addComponent(jTextFieldSecondLastName, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addGap(18, 18, 18)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(jLabel11, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                            .addComponent(jComboBoxCompanies, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addGap(18, 18, 18)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(jLabel12)
                            .addComponent(jComboBoxGenders, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(jLabel21))
                        .addGap(18, 18, 18)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(jLabel7)
                            .addComponent(jTextFieldDueDate, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addGap(13, 13, 13)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(jLabel14)
                            .addComponent(jTextFieldUsername, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addGap(18, 18, 18)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(btnAceptar)
                            .addComponent(btnCancelar))
                        .addGap(12, 12, 12))
                    .addGroup(layout.createSequentialGroup()
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(jLabel3)
                            .addComponent(cmbTipoExpediente, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addGap(18, 18, 18)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(jLabel4)
                            .addComponent(cmbComunidad, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(jTextFieldAccusedId, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addGap(18, 18, 18)
                        .addComponent(jLabel2)
                        .addGap(18, 18, 18)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(jLabel17)
                            .addComponent(jTextFieldDateStart, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(jLabel18)
                            .addComponent(jTextFieldDateEnd, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addGap(18, 18, 18)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(jLabel19)
                            .addComponent(jComboBoxSentenceType, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addGap(18, 18, 18)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(jLabel5)
                            .addComponent(jTextFieldCrimeDate, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addGap(18, 18, 18)
                        .addComponent(jComboBoxVerdicts, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(9, 9, 9)
                        .addComponent(jLabel6)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 67, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(0, 0, Short.MAX_VALUE))))
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void btnCancelarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnCancelarActionPerformed
        dispose();
    }//GEN-LAST:event_btnCancelarActionPerformed

    private void btnAceptarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnAceptarActionPerformed
        String current_gender = (String) jComboBoxGenders.getSelectedItem();
        String current_company = (String) jComboBoxCompanies.getSelectedItem();
        String current_transcripttype = (String) cmbTipoExpediente.getSelectedItem();
        String current_community = (String) cmbComunidad.getSelectedItem();
        String current_sentencetype = (String) jComboBoxSentenceType.getSelectedItem();
        String current_verdict = (String) jComboBoxVerdicts.getSelectedItem();
        Integer id_gender = Integer.valueOf(current_gender.split(" ")[0]);
        Integer id_company = Integer.valueOf(current_company.split(" ")[0]);
        Integer id_transcripttype = Integer.valueOf(current_transcripttype.split(" ")[0]);
        Integer id_community = Integer.valueOf(current_community.split(" ")[0]);
        Integer id_sentencetype = Integer.valueOf(current_sentencetype.split(" ")[0]);
        Integer id_verdict = Integer.valueOf(current_verdict.split(" ")[0]);
        if(!jTextFieldTranscriptNumber.getText().equals("")){
            if(!jTextFieldAccusedId.getText().equals("")){
                if(!jTextFieldBirthDate.getText().equals("")){
                    if(!jTextFieldName.getText().equals("")){
                        if(!jTextFieldLastName.getText().equals("")){
                            if(!jTextFieldSecondLastName.getText().equals("")){
                                if(!jTextFieldDueDate.getText().equals("")){
                                    if(!jTextFieldDateStart.getText().equals("")){
                                        if(!jTextFieldDateEnd.getText().equals("")){
                                            if(!jTextFieldCrimeDate.getText().equals("")){
                                                if(!jTextAreaCrimeDescription.getText().equals("")){                                                                                 
                                                    try{
                                                        if(!transcript_number.equals("")){
                                                            ArrayList<String> persons = allforeigns();
                                                            if(persons.contains(jTextFieldAccusedId.getText())){
                                                                connection_sqldb.DataBaseConnection.setTranscript(jTextFieldTranscriptNumber.getText(), 1, jTextFieldAccusedId.getText(), id_transcripttype, id_verdict, id_community, jTextFieldDateStart.getText(), jTextFieldDateEnd.getText(), id_sentencetype, jTextAreaCrimeDescription.getText(), jTextFieldCrimeDate.getText(), jTextFieldDueDate.getText());
                                                                connection_sqldb.DataBaseConnection.setPerson(jTextFieldAccusedId.getText(),jTextFieldName.getText(),jTextFieldLastName.getText(),jTextFieldSecondLastName.getText(), jTextFieldBirthDate.getText(), id_gender, id_company);
                                                                dispose();
                                                            } else {
                                                                JOptionPane.showMessageDialog(this, "La cédula del acusado no existe en el sistema", "Cuidado", JOptionPane.WARNING_MESSAGE);
                                                            }                                            
                                                        }
                                                        else{
                                                            connection_sqldb.DataBaseConnection.insertPerson(jTextFieldAccusedId.getText(),jTextFieldName.getText(),jTextFieldLastName.getText(),jTextFieldSecondLastName.getText(), jTextFieldBirthDate.getText(), id_gender, id_company);
                                                            connection_sqldb.DataBaseConnection.insertAccused(jTextFieldAccusedId.getText()); 
                                                            ArrayList<String> persons = allforeigns();
                                                            if(persons.contains(jTextFieldAccusedId.getText())){
                                                                connection_sqldb.DataBaseConnection.insertTranscript(jTextFieldTranscriptNumber.getText(), 1, username, jTextFieldAccusedId.getText(), id_transcripttype, id_verdict, id_community, jTextFieldDateStart.getText(), jTextFieldDateEnd.getText(), id_sentencetype, jTextAreaCrimeDescription.getText(), jTextFieldCrimeDate.getText(), jTextFieldDueDate.getText());                         
                                                                dispose();
                                                            } else {
                                                                JOptionPane.showMessageDialog(this, "La cédula del acusado no existe en el sistema", "Cuidado", JOptionPane.WARNING_MESSAGE);
                                                            }  
                                                        }
                                                    }
                                                    catch (SQLException e){
                                                        JOptionPane.showMessageDialog(this, e.toString(), "Cuidado", JOptionPane.ERROR_MESSAGE);
                                                    }
                                                    catch (NumberFormatException nfe){
                                                        JOptionPane.showMessageDialog(this, "Alguno de los datos introducidos debe ser un número", "Cuidado", JOptionPane.ERROR_MESSAGE);
                                                    }
                                                }else {
                                                    JOptionPane.showMessageDialog(this, "La casilla de descripción de crimen se encuentra vacía", "Cuidado", JOptionPane.WARNING_MESSAGE);
                                                }
                                            }else {
                                                JOptionPane.showMessageDialog(this, "La casilla de fecha de crimen se encuentra vacía", "Cuidado", JOptionPane.WARNING_MESSAGE);
                                            }
                                        }else {
                                            JOptionPane.showMessageDialog(this, "La casilla de fecha de finalizacion se encuentra vacía", "Cuidado", JOptionPane.WARNING_MESSAGE);
                                        }
                                    }else {
                                        JOptionPane.showMessageDialog(this, "La casilla de fecha de inicio se encuentra vacía", "Cuidado", JOptionPane.WARNING_MESSAGE);
                                    }
                                }else {
                                    JOptionPane.showMessageDialog(this, "La casilla de fecha de vencimiento se encuentra vacía", "Cuidado", JOptionPane.WARNING_MESSAGE);
                                }      
                            }else {
                                JOptionPane.showMessageDialog(this, "La casilla de segundo apellido se encuentra vacía", "Cuidado", JOptionPane.WARNING_MESSAGE);
                            }
                        }else {
                            JOptionPane.showMessageDialog(this, "La casilla de primer apellido se encuentra vacía", "Cuidado", JOptionPane.WARNING_MESSAGE);
                        }
                    }else {
                        JOptionPane.showMessageDialog(this, "La casilla de nombre se encuentra vacía", "Cuidado", JOptionPane.WARNING_MESSAGE);
                    }
                }else {
                    JOptionPane.showMessageDialog(this, "La casilla de fecha de nacimiento se encuentra vacía", "Cuidado", JOptionPane.WARNING_MESSAGE);
                }
            }else {
                JOptionPane.showMessageDialog(this, "La casilla del id de acusado se encuentra vacía", "Cuidado", JOptionPane.WARNING_MESSAGE);
            }
        }else {
            JOptionPane.showMessageDialog(this, "La casilla del número de expediente de usuario se encuentra vacía", "Cuidado", JOptionPane.WARNING_MESSAGE);
        }
    }//GEN-LAST:event_btnAceptarActionPerformed

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton btnAceptar;
    private javax.swing.JButton btnCancelar;
    private javax.swing.JComboBox<String> cmbComunidad;
    private javax.swing.JComboBox<String> cmbTipoExpediente;
    private javax.swing.JComboBox<String> jComboBoxCompanies;
    private javax.swing.JComboBox<String> jComboBoxGenders;
    private javax.swing.JComboBox<String> jComboBoxSentenceType;
    private javax.swing.JComboBox<String> jComboBoxVerdicts;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel10;
    private javax.swing.JLabel jLabel11;
    private javax.swing.JLabel jLabel12;
    private javax.swing.JLabel jLabel13;
    private javax.swing.JLabel jLabel14;
    private javax.swing.JLabel jLabel15;
    private javax.swing.JLabel jLabel16;
    private javax.swing.JLabel jLabel17;
    private javax.swing.JLabel jLabel18;
    private javax.swing.JLabel jLabel19;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel20;
    private javax.swing.JLabel jLabel21;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JLabel jLabel5;
    private javax.swing.JLabel jLabel6;
    private javax.swing.JLabel jLabel7;
    private javax.swing.JLabel jLabel8;
    private javax.swing.JLabel jLabel9;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JTextArea jTextAreaCrimeDescription;
    private javax.swing.JTextField jTextFieldAccusedId;
    private javax.swing.JTextField jTextFieldBirthDate;
    private javax.swing.JTextField jTextFieldCrimeDate;
    private javax.swing.JTextField jTextFieldDateEnd;
    private javax.swing.JTextField jTextFieldDateStart;
    private javax.swing.JTextField jTextFieldDueDate;
    private javax.swing.JTextField jTextFieldLastName;
    private javax.swing.JTextField jTextFieldName;
    private javax.swing.JTextField jTextFieldSecondLastName;
    private javax.swing.JTextField jTextFieldTranscriptNumber;
    private javax.swing.JTextField jTextFieldUsername;
    // End of variables declaration//GEN-END:variables
}
