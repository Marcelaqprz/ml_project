const amplifyconfig = ''' {
    "UserAgent": "aws-amplify-cli/2.0",
    "Version": "1.0",
    "auth": {
        "plugins": {
            "awsCognitoAuthPlugin": {
                "UserAgent": "aws-amplify-cli/0.1.0",
                "Version": "0.1.0",
                "IdentityManager": {
                    "Default": {}
                },
                "CredentialsProvider": {
                    "CognitoIdentity": {
                        "Default": {
                            "PoolId": "us-east-1:4867ddfa-f378-4317-947b-ea0375b1deb1",
                            "Region": "us-east-1"
                        }
                    }
                },
                "CognitoUserPool": {
                    "Default": {
                        "PoolId": "us-east-1_tHpwdsgxE",
                        "AppClientId": "pg0efenttmtj4tl5t7s9u92d6",
                        "Region": "us-east-1"
                    }
                },
                "Auth": {
                    "Default": {
                        "authenticationFlowType": "USER_SRP_AUTH",
                        "socialProviders": [],
                        "usernameAttributes": [
                            "EMAIL"
                        ],
                        "signupAttributes": [
                            "EMAIL"
                        ],
                        "passwordProtectionSettings": {
                            "passwordPolicyMinLength": 8,
                            "passwordPolicyCharacters": [
                                "REQUIRES_LOWERCASE",
                                "REQUIRES_NUMBERS",
                                "REQUIRES_SYMBOLS",
                                "REQUIRES_UPPERCASE"
                            ]
                        },
                        "mfaConfiguration": "OFF",
                        "mfaTypes": [
                            "SMS"
                        ],
                        "verificationMechanisms": [
                            "EMAIL"
                        ]
                    }
                },
                "S3TransferUtility": {
                    "Default": {
                        "Bucket": "mlproject2fd08a036aae4bb89a6867ac0ea73535134915-dev",
                        "Region": "us-east-1"
                    }
                },
                "AppSync": {
                    "Default": {
                        "ApiUrl": "https://wp52pitwvbcs7n6b2aqfaxwlu4.appsync-api.us-east-1.amazonaws.com/graphql",
                        "Region": "us-east-1",
                        "AuthMode": "API_KEY",
                        "ApiKey": "da2-q3ug2xu4ovb5vd7rqga3cwxg5q",
                        "ClientDatabasePrefix": "mlproject_API_KEY"
                    },
                    "mlproject_AWS_IAM": {
                        "ApiUrl": "https://wp52pitwvbcs7n6b2aqfaxwlu4.appsync-api.us-east-1.amazonaws.com/graphql",
                        "Region": "us-east-1",
                        "AuthMode": "AWS_IAM",
                        "ClientDatabasePrefix": "mlproject_AWS_IAM"
                    },
                    "mlproject_AMAZON_COGNITO_USER_POOLS": {
                        "ApiUrl": "https://wp52pitwvbcs7n6b2aqfaxwlu4.appsync-api.us-east-1.amazonaws.com/graphql",
                        "Region": "us-east-1",
                        "AuthMode": "AMAZON_COGNITO_USER_POOLS",
                        "ClientDatabasePrefix": "mlproject_AMAZON_COGNITO_USER_POOLS"
                    }
                }
            }
        }
    },
    "storage": {
        "plugins": {
            "awsS3StoragePlugin": {
                "bucket": "mlproject2fd08a036aae4bb89a6867ac0ea73535134915-dev",
                "region": "us-east-1",
                "defaultAccessLevel": "guest"
            }
        }
    },
    "api": {
        "plugins": {
            "awsAPIPlugin": {
                "mlproject": {
                    "endpointType": "GraphQL",
                    "endpoint": "https://wp52pitwvbcs7n6b2aqfaxwlu4.appsync-api.us-east-1.amazonaws.com/graphql",
                    "region": "us-east-1",
                    "authorizationType": "API_KEY",
                    "apiKey": "da2-q3ug2xu4ovb5vd7rqga3cwxg5q"
                }
            }
        }
    }
}''';