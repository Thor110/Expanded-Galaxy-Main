// ST: tr_leave_ehawk.nss (003EBO_s.rim)

#include "k_inc_hawk"

void main() {
    if(GetGlobalBoolean("HYPERSPACE")){
        //
    }
    else
    {
        //ExecuteScript();
        ExecuteScript("tr_leave_ehawk", GetFirstPC(), 0xFFFFFFFF);
    }
}