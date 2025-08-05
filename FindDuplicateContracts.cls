public class FindDuplicateContracts {
    @InvocableMethod(label='Find Duplicate Contracts')
    public static List<ContractResult> getResult(List<ContractInput> inputs) {
        List<ContractResult> results = new List<ContractResult>();
        Set<String> uniqueAccountIds = new Set<String>();
        Set<String> uniqueContractTypes = new Set<String>();
        Set<Id> currentContractIds = new Set<Id>();

        for (ContractInput input : inputs){
            if (input.accountId != null) uniqueAccountIds.add(input.accountId);
            if (input.contractType != null) uniqueContractTypes.add(input.contractType);
            if (input.recordId != null) currentContractIds.add(input.recordId);
        }

        if (uniqueAccountIds.isEmpty() || uniqueContractTypes.isEmpty()) return results;

        List<Contract> matchingContracts = [
            SELECT Id, Name, Status, StartDate, AccountId, Contract_Type__c
            FROM Contract
            WHERE AccountId IN :uniqueAccountIds
              AND Contract_Type__c IN :uniqueContractTypes
              AND Id NOT IN :currentContractIds
        ];

        for (Contract c : matchingContracts){
            ContractResult r = new ContractResult();
            r.Name = c.Name;
            r.Status = c.Status;
            r.StartDate = c.StartDate;
            r.ContractId = c.Id;
            results.add(r);
        }

        return results;
    }
}
