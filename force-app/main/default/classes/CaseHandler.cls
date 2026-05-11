public with sharing class CaseHandler {

    public static void mailBasedOnCasePriority(List<Case> casesList) {
        try {
            Set<Id> userIds = new Set<Id>();

            for (Case c : casesList) {
                if (c.Priority == 'High' && c.OwnerId != null) {
                    userIds.add(c.OwnerId);
                }
            }

         Map<Id, User> userMap = new Map<Id, User>(
                [
                    SELECT Id, Name, Email, Manager.Email
                    FROM User
                    WHERE Id IN :userIds
                ]
            );

            List<Messaging.SingleEmailMessage> mails = new List<Messaging.SingleEmailMessage>();

            for (Case c : casesList) {
                if (c.Priority == 'High' && c.OwnerId != null) {
                    User u = userMap.get(c.OwnerId);

                    if (u != null) {
                        List<String> toAddress = new List<String>();

                        if (u.Email != null && u.Email != '') {
                            toAddress.add(u.Email);
                        }

                        if (
                            u.Manager != null &&
                            u.Manager.Email != null &&
                            u.Manager.Email != ''
                        ) {
                            toAddress.add(u.Manager.Email);
                        }

                        if (!toAddress.isEmpty()) {
                            Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();

                            mail.setToAddresses(toAddress);
                            mail.setSubject('High Priority Case Notification');
                            mail.setPlainTextBody(
                                'A high priority case has been assigned.\n' +
                                'Case Number: ' + c.CaseNumber + '\n' +
                                'Subject: ' + c.Subject
                            );

                            mails.add(mail);
                        }
                    }
                }
            }

            if (!mails.isEmpty()) {
                Messaging.sendEmail(mails);
            }

        } catch (Exception e) {
            System.debug(e.getMessage());
        }
    }
}