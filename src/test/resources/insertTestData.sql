-- INSERT USERS
INSERT INTO self_xdsd.slf_users_xdsd
(username, provider, role, email)
VALUES ('vlad', 'github', 'user', 'vlad@example.com');
INSERT INTO self_xdsd.slf_users_xdsd
(username, provider, role, email)
VALUES ('mihai', 'gitlab', 'user' ,'mihai@example.com');
INSERT INTO self_xdsd.slf_users_xdsd
(username, provider, role, email)
VALUES ('amihaiemil', 'github', 'user', 'amihaiemil@gmail.com.com');
INSERT INTO self_xdsd.slf_users_xdsd
(username, provider, role, email)
VALUES ('johndoe', 'github', 'user', 'johndoe@gmail.com');

-----------------
-- INSERT PROJECT MANAGERS

INSERT INTO self_xdsd.slf_pms_xdsd
(userid, username, provider, access_token, commission)
VALUES ('33162107', 'zoeself', 'github', 'pm1ghtoken123', 6.5);

INSERT INTO self_xdsd.slf_pms_xdsd
(userid, username, provider, access_token, commission)
VALUES ('33162108', 'otherpm', 'github', 'pm1ghtoken124', 6.5);

-- INSERT PROJECTS

INSERT INTO self_xdsd.slf_projects_xdsd
(repo_fullname, provider, username, pmid, webhook_token)
VALUES ('amihaiemil/docker-java-api', 'github', 'amihaiemil', 1, 'whtoken123');

INSERT INTO self_xdsd.slf_projects_xdsd
(repo_fullname, provider, username, pmid, webhook_token)
VALUES ('amihaiemil/amihaiemil.github.io', 'github', 'amihaiemil', 1, 'whtoken124');

INSERT INTO self_xdsd.slf_projects_xdsd
(repo_fullname, provider, username, pmid, webhook_token)
VALUES ('vlad/test', 'github', 'vlad', 1, 'whtoken125');

INSERT INTO self_xdsd.slf_projects_xdsd
(repo_fullname, provider, username, pmid, webhook_token)
VALUES ('mihai/test', 'gitlab', 'mihai', 1, 'whtoken126');

INSERT INTO self_xdsd.slf_projects_xdsd
(repo_fullname, provider, username, pmid, webhook_token)
VALUES ('johndoe/stripe_repo', 'github', 'johndoe', 2, 'whtoken124');

-- INSERT CONTRIBUTORS

INSERT INTO self_xdsd.slf_contributors_xdsd (username, provider) VALUES ('john', 'github');
INSERT INTO self_xdsd.slf_contributors_xdsd (username, provider) VALUES ('maria', 'github');
INSERT INTO self_xdsd.slf_contributors_xdsd (username, provider) VALUES ('alexandra', 'github');
INSERT INTO self_xdsd.slf_contributors_xdsd (username, provider) VALUES ('dmarkov', 'github');
INSERT INTO self_xdsd.slf_contributors_xdsd (username, provider) VALUES ('bob', 'github');
INSERT INTO self_xdsd.slf_contributors_xdsd (username, provider) VALUES ('john', 'gitlab');

-- INSERT CONTRACTS

INSERT INTO self_xdsd.slf_contracts_xdsd
(repo_fullname, username, provider, role, hourly_rate)
VALUES ('amihaiemil/docker-java-api', 'john', 'github', 'DEV', 10000);

INSERT INTO self_xdsd.slf_contracts_xdsd
(repo_fullname, username, provider, role, hourly_rate)
VALUES ('amihaiemil/docker-java-api', 'john', 'github', 'REV', 6000);

INSERT INTO self_xdsd.slf_contracts_xdsd
(repo_fullname, username, provider, role, hourly_rate)
VALUES ('amihaiemil/docker-java-api', 'alexandra', 'github', 'DEV', 15000);

INSERT INTO self_xdsd.slf_contracts_xdsd
(repo_fullname, username, provider, role, hourly_rate)
VALUES ('amihaiemil/docker-java-api', 'maria', 'github', 'REV', 8000);

INSERT INTO self_xdsd.slf_contracts_xdsd
(repo_fullname, username, provider, role, hourly_rate)
VALUES ('vlad/test', 'maria', 'github', 'DEV', 16000);

INSERT INTO self_xdsd.slf_contracts_xdsd
(repo_fullname, username, provider, role, hourly_rate)
VALUES ('vlad/test', 'john', 'github', 'DEV', 16000);

INSERT INTO self_xdsd.slf_contracts_xdsd
(repo_fullname, username, provider, role, hourly_rate)
VALUES ('vlad/test', 'bob', 'github', 'DEV', 16000);

INSERT INTO self_xdsd.slf_contracts_xdsd
(repo_fullname, username, provider, role, hourly_rate)
VALUES ('vlad/test', 'maria', 'github', 'REV', 8000);

INSERT INTO self_xdsd.slf_contracts_xdsd
(repo_fullname, username, provider, role, hourly_rate)
VALUES ('vlad/test', 'maria', 'github', 'QA', 8000);

INSERT INTO self_xdsd.slf_contracts_xdsd -- this Contract is for testing SelfContracts.remove(...). Don't use it in other tests.
(repo_fullname, username, provider, role, hourly_rate, markedForRemoval)
VALUES ('vlad/test', 'maria', 'github', 'PO', 10000, '2020-10-10');

-- INSERT TASKS
INSERT INTO self_xdsd.slf_tasks_xdsd
(repo_fullname, issueId, provider, role, estimation_minutes)
VALUES
('vlad/test', '123', 'github', 'DEV', 60);

INSERT INTO self_xdsd.slf_tasks_xdsd
(repo_fullname, issueId, provider, role, estimation_minutes)
VALUES
('vlad/test', '124', 'github', 'DEV', 60);

INSERT INTO self_xdsd.slf_tasks_xdsd
(repo_fullname, issueId, provider, role, username, assigned, deadline, estimation_minutes)
VALUES
('amihaiemil/docker-java-api', '123', 'github', 'DEV', 'alexandra', '2020-06-07', '2020-06-17', 60);

INSERT INTO self_xdsd.slf_tasks_xdsd
(repo_fullname, issueId, provider, role, username, assigned, deadline, estimation_minutes)
VALUES
('amihaiemil/docker-java-api', '124', 'github', 'DEV', 'alexandra', '2020-06-14', '2020-06-24', 60);

INSERT INTO self_xdsd.slf_tasks_xdsd
(repo_fullname, issueId, provider, role, username, assigned, deadline, estimation_minutes)
VALUES
('amihaiemil/docker-java-api', '125', 'github', 'DEV', 'alexandra', '2020-06-14', '2020-06-24', 60);


INSERT INTO self_xdsd.slf_tasks_xdsd
(repo_fullname, issueId, provider, role, username, assigned, deadline, estimation_minutes)
VALUES
('amihaiemil/docker-java-api', '343', 'github', 'DEV', 'john', '2020-06-07', '2020-06-17', 60);

INSERT INTO self_xdsd.slf_tasks_xdsd
(repo_fullname, issueId, provider, role, username, assigned, deadline, estimation_minutes)
VALUES
('amihaiemil/docker-java-api', '223', 'github', 'REV', 'john', '2020-06-07', '2020-06-17', 60);

INSERT INTO self_xdsd.slf_tasks_xdsd
(repo_fullname, issueId, provider, role, username, assigned, deadline, estimation_minutes)
VALUES
('vlad/test', '887', 'github', 'QA', 'maria', '2020-08-25', '2020-09-04', 60);

INSERT INTO self_xdsd.slf_tasks_xdsd
(repo_fullname, issueId, provider, role, username, assigned, deadline, estimation_minutes)
VALUES
('vlad/test', '900', 'github', 'QA', 'maria', '2020-08-25', '2020-09-04', 60);

INSERT INTO self_xdsd.slf_tasks_xdsd
(repo_fullname, issueId, provider, role, estimation_minutes)
VALUES
('vlad/test', '901', 'github', 'DEV', 60);

INSERT INTO self_xdsd.slf_tasks_xdsd
(repo_fullname, issueId, provider, role, estimation_minutes)
VALUES
('vlad/test', '999', 'github', 'DEV', 60);

INSERT INTO `self_xdsd`.`slf_invoices_xdsd`
(invoiceId, repo_fullname, username, provider, role, createdAt, payment_timestamp, transactionId)
VALUES
(1, 'amihaiemil/docker-java-api', 'john', 'github', 'DEV', NOW() , null, null);

INSERT INTO `self_xdsd`.`slf_invoices_xdsd`
(invoiceId, repo_fullname, username, provider, role, createdAt, payment_timestamp, transactionId)
VALUES
(2, 'amihaiemil/docker-java-api', 'maria', 'github', 'REV', NOW() , null, null);

INSERT INTO `self_xdsd`.`slf_invoices_xdsd`
(invoiceId, repo_fullname, username, provider, role, createdAt, payment_timestamp, transactionId)
VALUES
(3, 'vlad/test', 'maria', 'github', 'PO', NOW() , null, null);

INSERT INTO `self_xdsd`.`slf_invoicedtasks_xdsd`
(invoiceId,
 repo_fullname,
 username,
 provider,
 role,
 value,
 commission,
 issueId,
 assigned,
 deadline,
 invoiced,
 estimation_minutes)
VALUES
(   1,
    'amihaiemil/docker-java-api',
    'john',
    'github',
    'DEV',
    15000,
    50,
    '200',
    '2020-06-01',
    '2020-06-11',
    NOW(),
    90
);
INSERT INTO `self_xdsd`.`slf_invoicedtasks_xdsd`
(invoiceId,
 repo_fullname,
 username,
 provider,
 role,
 value,
 commission,
 issueId,
 assigned,
 deadline,
 invoiced,
 estimation_minutes)
VALUES
(   2,
    'amihaiemil/docker-java-api',
    'maria',
    'github',
    'REV',
    8000,
    50,
    '201',
    '2020-06-01',
    '2020-06-11',
    NOW(),
    60
);

INSERT INTO `self_xdsd`.`slf_invoicedtasks_xdsd`
(invoiceId, repo_fullname, username, provider, role, value, commission, issueId, assigned, deadline, invoiced, estimation_minutes)
VALUES
(3, 'vlad/test', 'maria', 'github', 'PO', 10000, 50, '100', '2020-06-01', '2020-06-11', NOW(), 60);

INSERT INTO `self_xdsd`.`slf_wallets_xdsd`
(`repo_fullname`, `provider`, `type`, `cash`, `active`, `identifier`)
VALUES
('amihaiemil/docker-java-api', 'github', 'FAKE', 1000000000, 0, 'fakew-1232');

INSERT INTO `self_xdsd`.`slf_wallets_xdsd`
(`repo_fullname`, `provider`, `type`, `cash`, `active`, `identifier`)
VALUES
('amihaiemil/docker-java-api', 'github', 'STRIPE', 10000, 1, 'stripewallet-1232');

INSERT INTO `self_xdsd`.`slf_wallets_xdsd`
(`repo_fullname`, `provider`, `type`, `cash`, `active`, `identifier`)
VALUES
('johndoe/stripe_repo', 'github', 'STRIPE', 5000, 1, 'stripewallet-4444');

INSERT INTO `self_xdsd`.`slf_paymentmethods_xdsd` (`repo_fullname`,`provider`,`type`,`identifier`,`active`)
VALUES ('johndoe/stripe_repo', 'github', 'STRIPE', 'stripe_pm_to_delete', 0);

INSERT INTO `self_xdsd`.`slf_paymentmethods_xdsd` (`repo_fullname`,`provider`,`type`,`identifier`,`active`)
VALUES ('johndoe/stripe_repo', 'github', 'STRIPE', 'stripe_pm_active', 1);

INSERT INTO `self_xdsd`.`slf_paymentmethods_xdsd` (`repo_fullname`,`provider`,`type`,`identifier`,`active`)
VALUES ('johndoe/stripe_repo', 'github', 'STRIPE', 'stripe_pm_inactive', 0);

INSERT INTO `self_xdsd`.`slf_paymentmethods_xdsd` (`repo_fullname`,`provider`,`type`,`identifier`,`active`)
VALUES ('amihaiemil/docker-java-api', 'github', 'STRIPE', 'stripe_pm_1', 1);

INSERT INTO `self_xdsd`.`slf_paymentmethods_xdsd` (`repo_fullname`,`provider`,`type`,`identifier`,`active`)
VALUES ('amihaiemil/docker-java-api', 'github', 'STRIPE', 'stripe_pm_2', 0);

INSERT INTO `self_xdsd`.`slf_resignations_xdsd`
(`repo_fullname`, `username`, `provider`, `issueId`, `timestamp`,`reason`)
VALUES
('vlad/test', 'maria', 'github', '999', '2020-09-03', 'DEADLINE' );

INSERT INTO `self_xdsd`.`slf_resignations_xdsd`
(`repo_fullname`, `username`, `provider`, `issueId`, `timestamp`,`reason`)
VALUES
('vlad/test', 'john', 'github', '999', '2020-09-01', 'ASKED' );

INSERT INTO `self_xdsd`.`slf_payoutmethods_xdsd`
(`username`, `provider`, `type`, `active`, `identifier`)
VALUES ('maria', 'github', 'stripe', 1, 'acct_001');
