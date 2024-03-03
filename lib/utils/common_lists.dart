import 'package:domain/model/get_modules_response/users_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../di/notifier/users_list_notifier.dart';

class CommonLists{
  static List<Map<String, dynamic>> paymentTypeList = [
    {
      "label": 'Cash',
      "value": 1
    },
    {
      "label": 'Phone Pay',
      "value": 2
    },
    {
      "label": 'Google Pay',
      "value": 3
    },
    {
      "label": 'PayTM',
      "value": 4
    },
    {
      "label": 'Other Online',
      "value": 5
    }
  ];

  static List<Map<String, dynamic>> houseTypeList = [
    {
      "label": "Own",
      "value": 1
    },
    {
      "label": "Rent",
      "value": 2
    }
  ];

  static List<Map<String, dynamic>> productTypeList = [
    {
      "label": "Deposit",
      "value": 1
    },
    {
      "label": "Mortgage Loan",
      "value": 2
    },
    {
      "label": "Housing Loan",
      "value": 3
    },
    {
      "label": "LAP",
      "value": 4
    },
    {
      "label": "Gold Loan",
      "value": 5
    },
    {
      "label": "Personal Loan",
      "value": 6
    },
    {
      "label": "Third Party",
      "value": 7
    },
    {
      "label": "MEL",
      "value": 8
    },
    {
      "label": "Group Lending",
      "value": 9
    },
    {
      "label": "Individual Lending",
      "value": 10
    },
  ];

  static List<Map<String, dynamic>> loanSheduleList = [
    {
      "label": "Weekly",
      "value": 1
    },
    {
      "label": "Daily",
      "value": 1
    },
    {
      "label": "Monthly",
      "value": 3
    },
  ];

  static List<Map<String, dynamic>> loanAmountList = [
    {
      "label": "Rs.5,000",
      "value": 5000
    },
    {
      "label": "Rs.6,000",
      "value": 6000
    },
    {
      "label": "Rs.7,000",
      "value": 7000
    },
    {
      "label": "Rs.8,000",
      "value": 8000
    },
    {
      "label": "Rs.9,000",
      "value": 9000
    },
    {
      "label": "Rs.10,000",
      "value": 10000
    },
    {
      "label": "Rs.15,000",
      "value": 15000
    },
    {
      "label": "Rs.20,000",
      "value": 20000
    },
    {
      "label": "Rs.25,000",
      "value": 25000
    },
    {
      "label": "Rs.30,000",
      "value": 30000
    },
    {
      "label": "Rs.35,000",
      "value": 35000
    },
    {
      "label": "Rs.40,000",
      "value": 40000
    },
    {
      "label": "Rs.45,000",
      "value": 40000
    },
    {
      "label": "Rs.50,000",
      "value": 50000
    },
    {
      "label": "Rs.60,000",
      "value": 60000
    },
    {
      "label": "Rs.70,000",
      "value": 70000
    },
    {
      "label": "Rs.80,000",
      "value": 80000
    },
    {
      "label": "Rs.90,000",
      "value": 90000
    },
    {
      "label": "Rs.100,000",
      "value": 100000
    },
  ];

  static List<Map<String, dynamic>> despositList = [
    {
      "label": "Daily",
      "value": 1
    },
    {
      "label": "Weekly",
      "value": 2
    },
    {
      "label": "Monthly",
      "value": 3
    },
    {
      "label": "Recuring Deposit",
      "value": 4
    },
  ];

  static List<Map<String, dynamic>> tenureList = [
    {
      "label": "50",
      "value": 1
    },
    {
      "label": "40",
      "value": 2
    },
    {
      "label": "35",
      "value": 3
    },
    {
      "label": "30",
      "value": 4
    },
    {
      "label": "25",
      "value": 5
    },
    {
      "label": "12",
      "value": 6
    },
  ];

  static String getPaymentType(String type){
    try{
      for(var each in paymentTypeList){
        if(each['value'].toString() == type){
          return each['label'];
        }
      }
      return "";
    }catch(e){
      return "";
    }
  }

    static String getTenureValue(String type){
    try{
      for(var each in tenureList){
        if(each['value'].toString() == type){
          return each['label'];
        }
      }
      return "";
    }catch(e){
      return "";
    }
  }

    static String getRepayModeValue(String type){
    try{
      for(var each in loanSheduleList){
        if(each['value'].toString() == type){
          return each['label'];
        }
      }
      return "";
    }catch(e){
      return "";
    }
  }

  static String getHouseType(String type){
    try{
      for(var each in houseTypeList){
        if(each['value'].toString() == type){
          return each['label'];
        }
      }
      return "";
    }catch(e){
      return "";
    }
  }

  static String getdespositType(String type){
    try{
      for(var each in despositList){
        if(each['value'].toString() == type){
          return each['label'];
        }
      }
      return "Not Selected";
    }catch(e){
      return "";
    }
  }

  static String getProductType(String type){
    try{
      for(var each in productTypeList){
        if(each['value'].toString() == type){
          return each['label'];
        }
      }
      return "";
    }catch(e){
      return "";
    }
  }

  static String getUserName(BuildContext context,String id){
    try{
      List<UsersListResponseData> usersList = ProviderScope.containerOf(context).read(allUsersListNotifierProvider);
      if(usersList.isNotEmpty){
        for(var each in usersList){
          if(each.id == id){
            return each.uname;
          }
        }
      }
      return "";
    }catch(e){
      return "";
    }
  }
}