String cronExp = '0 0 2 * * ?';

System.schedule(
    'Nightly Account Batch Update',
    cronExp,
    new SchduleBatchUpdateAccount()
);