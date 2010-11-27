#!/usr/bin/env ruby -wKU

require 'otapi'

path =  File.expand_path(File.dirname(__FILE__))
substring = "classes"
ss_start = path.index(substring)
path[ss_start, substring.length] = ""
path += "Open-Transactions/testwallet/data_folder"
Otapi.OT_API_Init path

Otapi.OT_API_LoadWallet "wallet.xml"


string OT_API_WriteCheque(string SERVER_ID,
                                string CHEQUE_AMOUNT, 
                                string VALID_FROM, 
                                string VALID_TO,
                                string SENDER_ACCT_ID,
                                string SENDER_USER_ID,
                                string CHEQUE_MEMO, 
                                string RECIPIENT_USER_ID);


string OT_API_LoadUserPubkey(string USER_ID); # returns NULL, or a public key.



int OT_API_VerifyUserPrivateKey(string USER_ID); # returns OT_BOOL



string OT_API_LoadPurse(string SERVER_ID,
                              string ASSET_TYPE_ID); # returns NULL, or a purse.

string OT_API_LoadMint(string SERVER_ID,
                             string ASSET_TYPE_ID); # returns NULL, or a mint

string OT_API_LoadAssetContract(string ASSET_TYPE_ID); # returns NULL, or an asset contract.




string OT_API_LoadAssetAccount(string SERVER_ID,
                                     string USER_ID,
                                     string ACCOUNT_ID); # Returns NULL, or an account.
string OT_API_LoadInbox(string SERVER_ID,
                              string USER_ID,
                              string ACCOUNT_ID); # Returns NULL, or an inbox.
string OT_API_LoadOutbox(string SERVER_ID,
                               string USER_ID,
                               string ACCOUNT_ID); # returns NULL, or an outbox.


# *** MESSAGES BEING SENT TO THE SERVER -- BELOW!!! ***




 OT_API_checkServerID(string SERVER_ID, string USER_ID);


 OT_API_createUserAccount(string SERVER_ID,
                              string USER_ID);

 OT_API_checkUser(string SERVER_ID,
                      string USER_ID,
                      string USER_ID_CHECK);


 OT_API_getRequest(string SERVER_ID,
                       string USER_ID);

 OT_API_getTransactionNumber(string SERVER_ID,
                                 string USER_ID);



 OT_API_issueAssetType(string SERVER_ID,
                           string USER_ID,
                           string THE_CONTRACT);



 OT_API_getContract(string SERVER_ID,
                        string USER_ID,
                        string ASSET_ID);




 OT_API_getMint(string SERVER_ID,
                    string USER_ID,
                    string ASSET_ID);





 OT_API_createAssetAccount(string SERVER_ID,
                               string USER_ID,
                               string ASSET_ID);




 OT_API_getAccount(string SERVER_ID,
                       string USER_ID,
                       string ACCT_ID);



 OT_API_issueBasket(string SERVER_ID,
                        string USER_ID,
                        string BASKET_INFO);


 OT_API_exchangeBasket(string SERVER_ID,
                           string USER_ID,
                           string BASKET_ASSET_ID,
                           string BASKET_INFO);



 OT_API_notarizeWithdrawal(string SERVER_ID,
                               string USER_ID,
                               string ACCT_ID,
                               string AMOUNT);


 OT_API_notarizeDeposit(string SERVER_ID,
                            string USER_ID,
                            string ACCT_ID,
                            string THE_PURSE);


 OT_API_notarizeTransfer(string SERVER_ID,
                             string USER_ID,
                             string ACCT_FROM,
                             string ACCT_TO,
                             string AMOUNT,
                             string NOTE);


 OT_API_getInbox(string SERVER_ID,
                     string USER_ID,
                     string ACCT_ID);



 OT_API_processInbox(string SERVER_ID,
                         string USER_ID,
                         string ACCT_ID,
                         string ACCT_LEDGER);



 OT_API_withdrawVoucher(string SERVER_ID,
                            string USER_ID,
                            string ACCT_ID,
                            string RECIPIENT_USER_ID,
                            string CHEQUE_MEMO,
                            string AMOUNT);


 OT_API_depositCheque(string SERVER_ID,
                          string USER_ID,
                          string ACCT_ID,
                          string THE_CHEQUE);









# NOTE:  THE BELOW FUNCTIONS *DO NOT* SEND ANY MESSAGE TO THE SERVER,
#        BUT RATHER, THEY ONLY QUERY FOR DATA FROM LOCAL STORAGE.
#

int OT_API_GetNymCount();
int OT_API_GetServerCount();
int OT_API_GetAssetTypeCount();
int OT_API_GetAccountCount();

string OT_API_GetNym_ID(int nIndex); # based on Index (above 4 functions) this returns the Nym's ID
string OT_API_GetNym_Name(string NYM_ID); # Returns Nym Name (based on NymID)

string OT_API_GetServer_ID(int nIndex); # based on Index (above 4 functions) this returns the Server's ID
string OT_API_GetServer_Name(string SERVER_ID); # Return's Server's name (based on server ID)

string OT_API_GetAssetType_ID(int nIndex); # returns Asset Type ID (based on index from GetAssetTypeCount)
string OT_API_GetAssetType_Name(string ASSET_TYPE_ID); # Returns asset type name based on Asset Type ID


string OT_API_GetAccountWallet_ID(int nIndex);     # returns a string containing the account ID, based on index.
string OT_API_GetAccountWallet_Name(string ACCOUNT_ID);  # returns the account name, based on account ID.
string OT_API_GetAccountWallet_Balance(string ACCOUNT_ID);   # returns the account balance, based on account ID.
string OT_API_GetAccountWallet_Type(string ACCOUNT_ID);  # returns the account type (simple, issuer, etc)
string OT_API_GetAccountWallet_AssetTypeID(string ACCOUNT_ID);   # returns asset type of the account





int OT_API_Ledger_GetCount(string SERVER_ID,
                           string USER_ID,
                           string ACCOUNT_ID,
                           string THE_LEDGER); # Returns number of transactions within.



string OT_API_Ledger_CreateResponse(string SERVER_ID,
                                          string USER_ID,
                                          string ACCOUNT_ID,
                                          string ORIGINAL_LEDGER); 



string OT_API_Ledger_GetTransactionByIndex(string SERVER_ID,
                                                 string USER_ID,
                                                 string ACCOUNT_ID,
                                                 string THE_LEDGER,
                                                 int nIndex); # returns transaction by index.

string OT_API_Ledger_GetTransactionByID(string SERVER_ID,
                                              string USER_ID,
                                              string ACCOUNT_ID,
                                              string THE_LEDGER,
                                              string TRANSACTION_NUMBER); # returns transaction by ID.

string OT_API_Ledger_GetTransactionIDByIndex(string SERVER_ID,
                                                   string USER_ID,
                                                   string ACCOUNT_ID,
                                                   string THE_LEDGER,
                                                   int nIndex); # returns transaction number by index.



string OT_API_Ledger_AddTransaction(string SERVER_ID,
                                          string USER_ID,
                                          string ACCOUNT_ID,
                                          string THE_LEDGER,
                                          string THE_TRANSACTION);



string OT_API_Transaction_CreateResponse(string SERVER_ID,
                                               string USER_ID,
                                               string ACCOUNT_ID,
                                               string RESPONSE_LEDGER, # To be sent to the server...
                                               string ORIGINAL_TRANSACTION, # Responding to...?
                                               int BOOL_DO_I_ACCEPT);   # 0 or 1  (OT_TRUE or OT_FALSE.)




# Get Transaction Type  (internally uses GetTransactionTypeString().)
string OT_API_Transaction_GetType(string SERVER_ID,
                                        string USER_ID,
                                        string ACCOUNT_ID,
                                        string THE_TRANSACTION);





int OT_API_ConnectServer(string SERVER_ID, string USER_ID, 
                         string szCA_FILE, string szKEY_FILE, 
                         string szKEY_PASSWORD);
                         
int OT_API_ProcessSockets();    # Probably not necessary in HTTP mode.
