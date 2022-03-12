global class SaveAttachment {

        Public Contact accRec {get;set;}
        public String QuoteId;
        

    Public SaveAttachment(ApexPages.StandardController controller) {
        QuoteId=controller.getId();
        accRec = [select Name,CreatedDate from Contact where Id=:controller.getId()]; 
        //accRec.pdf_flage__c=true;
        //update accRec;
    }
    @InvocableMethod (label='Create Attachment')
    public static void saveAttach(List<Staging_id>staging_id)  {
        system.debug('yes its calling');
        for(Staging_id stid:staging_id){
        PageReference pdfPage = new PageReference('/apex/generatepdf?id='+stid.staging_id);
        Blob pdfBlob = pdfPage.getContentAspdf();
        Attachment att = new Attachment();
       // ParentId = ApexPages.currentPage().getParameters().get('id'),name='Astala' + '.pdf',body = pdfBlob
            att.ParentId=stid.staging_id;
            att.name='test.pdf';
            att.body=pdfBlob;
            
            insert att ;
        }
    }
    public void updateRec()
    {
        Contact st = [select Name from Contact where Id=:QuoteId LIMIT 1]; 
        st.pdf_flage__c=true;
        update st;
    }
    global class Staging_id{
        @InvocableVariable(label='Staging id' required=true)
        public String staging_id;
    }
    
}