--Transcript's foreign keys
    --Userapp
ALTER TABLE TRANSCRIPT
    ADD CONSTRAINT fk_transcript_user FOREIGN KEY
    (username) REFERENCES
    US.USERAPP(username);
   
    --Accused
ALTER TABLE TRANSCRIPT
    ADD CONSTRAINT fk_transcript_accused FOREIGN KEY
    (id_accused) REFERENCES
    ACCUSED(id_accused);
    
    --TranscriptType
ALTER TABLE TRANSCRIPT
    ADD CONSTRAINT fk_transcript_trType FOREIGN KEY
    (id_transcripttype) REFERENCES
    TRANSCRIPTTYPE(id_transcripttype);
    
    --Verdict
ALTER TABLE TRANSCRIPT
    ADD CONSTRAINT fk_transcript_verdict FOREIGN KEY
    (id_verdict) REFERENCES
    VERDICT(id_verdict);
    
    --Community
ALTER TABLE TRANSCRIPT
    ADD CONSTRAINT fk_transcript_community FOREIGN KEY
    (id_community) REFERENCES
    Place.COMMUNITY(id_community);
    
    --Sentence
ALTER TABLE TRANSCRIPT
    ADD CONSTRAINT fk_transcript_sentence FOREIGN KEY
    (id_sentence) REFERENCES
    SENTENCE(id_sentence);
    
    --Crime
ALTER TABLE TRANSCRIPT
    ADD CONSTRAINT fk_transcript_crime FOREIGN KEY
    (id_crime) REFERENCES
    CRIME(id_crime);
    
--Accused's foreign keys
    --ID
ALTER TABLE ACCUSED
    ADD CONSTRAINT fk_accused_id FOREIGN KEY
    (id_accused) REFERENCES
    PRSN.PERSON(id_person);
    
--Sentence's foreign key
    --Sentence Type
ALTER TABLE SENTENCE
    ADD CONSTRAINT fk_sentence_senType FOREIGN KEY
    (id_sentencetype) REFERENCES
    SENTENCETYPE(id_sentencetype);
    
--Photo's foreign key
    --Accused ID
ALTER TABLE PHOTO
    ADD CONSTRAINT fk_photo_accused FOREIGN KEY
    (id_accused) REFERENCES
    ACCUSED(id_accused);