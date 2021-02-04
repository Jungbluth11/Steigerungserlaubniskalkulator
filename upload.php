<?php
header("Content-Type: text/html; charset=utf-8");
header("Cache-control: no-cache, muat revalidate");
header("Pragma: no-cache, must-revalidate");
function passgen($length){
    $pool = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    $pool .= "abcdefghijklmnopqrstuvwxyz";
    $pool .= "1234567890";
    $password="";
    for($i = 0; $i < $length; $i++){
        $password .= $pool{rand(0, strlen($pool)-1)};
    }
    return $password;
}
function getXML($url){
    try{
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($ch, CURLOPT_HTTPHEADER, array("Accept-Language: de-de, de;"));
        curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 90 );
        $content = curl_exec ($ch);
        curl_close ($ch);

        $xml = new SimpleXMLElement($content);
//        print_r($content);
//        print_r($xml);
    }
    catch(Exception $e){
        echo "exception caught: ".$e->getMessage();
    }
    return $xml;
}
function getData($url){
//   echo $url; 
   $xml = getXML($url);
   $data = array();
   $pattern = array("/ä/","/ö/","/ü/","/Ä/","/Ü/","/ß/");
   $replacement = array("&auml;","&ouml;","&uuml;","&Auml;","&Uuml;","&szlig;");
   $data["name"] = (string) $xml->held["name"];
   $data["eigenschaften"] = array();
   foreach($xml->held->eigenschaften->eigenschaft as $eigenschaft){
        if($eigenschaft["name"] == "ini"){
            break;
        }
        else if($eigenschaft["name"] != "Sozialstatus"){
        $data["eigenschaften"][] = array(
            "name" => preg_replace($pattern,$replacement, (string)$eigenschaft["name"]),
            "value" => (int) $eigenschaft["value"],
            "mod" => (int) $eigenschaft["mod"],
            "mrmod" => (int) $eigenschaft["mrmod"]
        );    
        }
        
   }
   $data["vorteile"] = array();
   foreach ($xml->held->vt->vorteil as $vorteil){
        if(preg_match("/(Gutes|Eidetisches) Gedächniss|Vergesslichkeit|Unseht|Begabung |Unfähigkeit|Astralmacht|Viertelzauberer/",(string) $vorteil["name"])){
            $data["vorteile"][] = array(
                "name" => preg_replace($pattern, $replacement, (string)$vorteil["name"]),
                "value" => (string) $vorteil["value"]  
            ); 
        }
   }
   $data["sonderfertigkeiten"] = array();
   foreach($xml->held->sf->sonderfertigkeit as $sonderfertigkeit){
        if(preg_match("/Merkmalskenntnis|Repräsentation/",(string) $sonderfertigkeit["name"])){
            $merkmal = explode(":", (string) $sonderfertigkeit["name"]);
            $data["sonderfertikeiten"][] = preg_replace($pattern, $replacement, trim($merkmal[1]));
        }
   }
   $data["talente"] = array();
   foreach($xml->held->talentliste->talent as $talent){
        $data["talente"][] = array(
            "name" => preg_replace($pattern, $replacement, (string)$talent["name"]),
            "value" => (int) $talent["value"]  
        );
   }
   $data["zauber"] = array();
   foreach($xml->held->zauberliste->zauber as $zauber){
        $data["zauber"][] = array(
            "name" => preg_replace($pattern, $replacement, (string)$zauber["name"]),
            "value" => (int) $zauber["value"],
            "hauszauber" => (string) $zauber["hauszauber"],
            "rep" => (string) $zauber["repraesentation"]
        );
   }
   return $data; 
}
if(isset($_POST["upload"]) && $_FILES["datei"]["type"] == "text/xml"){
    include 'connect.php';
    $file = "/upload/".passgen(8).".xml";
    move_uploaded_file($_FILES["datei"]["tmp_name"],".".$file);
    
//    $pdoobj = $pdo->query("SELECT * FROM komplex ORDER BY komplex ASC");
//    $tbl_komplex = $pdoobj->fetchAll(PDO::FETCH_ASSOC);
//    print_r($tbl_komplex);
    
//    print_r($steigerungstabelle);
    
    $xmlData = getData("localhost/Steigerungserlaubnisskalkulator".$file);
//    print_r($xmlData);
    $char = array();
    $char["name"] = $xmlData["name"];
    $char["eigenschaften"] = array();
    foreach($xmlData["eigenschaften"] as $eigenschaft){
        switch($eigenschaft["name"]){
            case "Lebensenergie":
                $char["eigenschaften"][] = array(
                    "name" => $eigenschaft["name"],
                    "stufe" => $eigenschaft["value"],
                    "gesamt" => (int) ceil(($xmlData["eigenschaften"][6]["value"]+$xmlData["eigenschaften"][6]["value"]+$xmlData["eigenschaften"][7]["value"])/2+ $eigenschaft["mod"])
                );
                break;
            case "Ausdauer":
                $char["eigenschaften"][] = array(
                    "name" => $eigenschaft["name"],
                    "stufe" => $eigenschaft["value"],
                    "gesamt" => (int) ceil(($xmlData["eigenschaften"][0]["value"]+$xmlData["eigenschaften"][6]["value"]+$xmlData["eigenschaften"][5]["value"])/2+ $eigenschaft["mod"])
                );
                break;
            case "Astralenergie":
                if($eigenschaft["mod"] == 0){
                    $char["eigenschaften"][] = array(
                        "name" => $eigenschaft["name"],
                        "stufe" => 0,
                        "gesamt" => 0
                    );
                }
                else{
                    $char["eigenschaften"][] = array(
                    "name" => $eigenschaft["name"],
                    "stufe" => $eigenschaft["value"],
                    "gesamt" => (int) ceil(($xmlData["eigenschaften"][0]["value"]+$xmlData["eigenschaften"][2]["value"]+$xmlData["eigenschaften"][3]["value"])/2+ $eigenschaft["mod"] + $eigenschaft["mrmod"])
                );
                }
                break;
            case "Karmaenergie":
                break;
            case "Magieresistenz":
                $char["eigenschaften"][] = array(
                    "name" => $eigenschaft["name"],
                    "stufe" => $eigenschaft["value"],
                    "gesamt" => (int) ceil(($xmlData["eigenschaften"][6]["value"]+$xmlData["eigenschaften"][6]["value"]+$xmlData["eigenschaften"][7]["value"])/5+ $eigenschaft["mod"])
                );
                break;
            default :
                $char["eigenschaften"][] = array(
                    "name" => $eigenschaft["name"],
                    "stufe" => $eigenschaft["value"],
                    "gesamt" => 0
                );
                break;
        } 
    }
    $char["vorteile"] = array();
    foreach($xmlData["vorteile"] as $vorteil){
        if(preg_match("/Begabung/",$vorteil["name"])){
            $vt = "begabung";
        }
        else if(preg_match("/Unf&auml;higkeit/",$vorteil["name"])){
            $vt = "unfähigkeit";
        }
        else{
            $vt = $vorteil["name"];
//            var_dump($vt);
        }
        switch($vt){
            case "begabung":
                $char["vorteile"][] = array(
                    "value" => $vorteil["value"],
                    "modifikator" => -1
                );
                break;
            case "unfähigkeit":
                $char["vorteile"][] = array(
                    "value" => $vorteil["value"],
                    "modifikator" => 1
                );
                break;
            case "Astralmacht":
                $char["eigenschaften"][10]["gesamt"] = $char["eigenschaften"][10]["gesamt"] + (int)$vorteil["value"];
                break;
            case "Eidetisches Gedächnis":
                $char["vorteile"][] = array(
                    "value" => "Wissen",
                    "modifikator" => -1
                );
                $char["vorteile"][] = array(
                    "value" => "Sprachen",
                    "modifikator" => -1
                );
                $char["vorteile"][] = array(
                    "value" => "Lseen/Schreiben",
                    "modifikator" => -1
                );
                $char["vorteile"][] = array(
                    "value" => "Handwerk",
                    "modifikator" => -1
                );
                break;
            case "Unsteht":
                $char["vorteile"][] = array(
                    "value" => "Wissen",
                    "modifikator" => 1
                );
                $char["vorteile"][] = array(
                    "value" => "Sprachen",
                    "modifikator" => 1
                );
                $char["vorteile"][] = array(
                    "value" => "Lseen/Schreiben",
                    "modifikator" => 1
                );
                $char["vorteile"][] = array(
                    "value" => "Handwerk",
                    "modifikator" => 1
                );
                break;
            case "Viertelzauberer":
                $char["vorteile"][] = array(
                    "value" => $vorteil["name"],
                    "modifikator" => 0
                );
            
        }
    }
    $char["sonderfertigkeiten"] = $xmlData["sonderfertigkeiten"];
    $char["talente"] = array();
    foreach($xmlData["talente"] as $talent){
        if(preg_match("/Sprachen kennen/", $talent["name"])){
            $explode = explode("kennen",$talent["name"]);
//            print_r($explode);
            $name = trim($explode[1]);
        }
        else{
            $name = $talent["name"];
        }
        $char["talente"][] = array(
            "name" => $name,
            "stufe" => $talent["value"],
        );
    }
    $char["zauber"] = array();
    foreach($xmlData["zauber"] as $zauber){
        $char["zauber"][] = array(
            "name" => $zauber["name"],
            "stufe" => $zauber["value"],
            "hauszauber" => $zauber["hauszauber"],
        );
    }
//    print_r($char);
    if($_POST["action"] == "new"){
        $add_char = $pdo->query("INSERT INTO charaktere(name,timestamp) VALUES ('".$char["name"]."',".time().")");
//    var_dump($add_char);
    }
    else{
        $add_char = true;
    }
    if($add_char){
        if($_POST["action"] == "new"){
            $pdoobj = $pdo->query("SELECT id FROM charaktere WHERE name ='".$char["name"]."' ORDER BY id DESC");
            $fetch = $pdoobj->fetch(PDO::FETCH_ASSOC);
    //        print_r($fetch["id"]);
            $id = (int)$fetch["id"];
        }
        else{
            $id = (int) $_POST["id"];
        }
        if($_POST["action"] == "new"){
            foreach($char["eigenschaften"] as $eigenschaft){
                $eigenschaft["stufe"]++;
                if($eigenschaft["name"] == "Ausdauer"){
                    $komplex = 5;
                }
                else{
                    $komplex = 8;
                }
                $pdoobj = $pdo->query("SELECT * FROM steigerungstabelle WHERE stufe =".(int)$eigenschaft["stufe"]." AND komplex=".$komplex);
    //            var_dump($eigenschaft["stufe"]);
    //            var_dump($pdoobj);
                $steigerung = $pdoobj->fetch(PDO::FETCH_ASSOC);
    //            var_dump($eigenschaft);
    //            var_dump($steigerung);
    //            var_dump(time());
                $pdo->query("INSERT INTO charakter_eigenschaften(name, stufe, gesamt, aktuell, gesamt_frei, gesamt_se, gesamt_erlaubnis, charakter, timestamp) VALUES('".$eigenschaft["name"]."',".$eigenschaft["stufe"].",".$eigenschaft["gesamt"].",0,".(int)$steigerung["frei"].",".(int)$steigerung["se"].",".(int)$steigerung["erlaubnis"].",".$id.",".time().")");
    //            print_r($pdo->errorInfo());
            }
        }
        foreach($char["vorteile"] as $vorteil){
            $pdo->query("INSERT INTO vorteile(value, modifikator, charakter) VALUES ('".$vorteil["value"]."',".$vorteil["modifikator"].",".$id.")");
        }
        foreach($char["sonderfertigkeiten"] as $sonderfertigkeit){
            $pdo->query("INSERT INTO `sonderfertigkeiten`(value, charakter) VALUES ('".$sonderfertigkeit."',".$id.")");
        }
        foreach($char["talente"] as $talent){
//            var_dump($talent);
            if($_POST["action"] == "update"){
                $pdoobj = $pdo->query("SELECT id FROM charakter_talente WHERE talent=".$fetch["id"]." AND charakter=".$id);
//                var_dump($pdo);
                $test = $pdoobj->fetch(PDO::FETCH_ASSOC);
//                var_dump($test);
            }
            if(!$test){
                $pdoobj= $pdo->query("SELECT id,komplex,talentgruppe FROM talente WHERE name='".$talent["name"]."'");
                $fetch = $pdoobj->fetch(PDO::FETCH_ASSOC);
                $fetch["komplex"] = (int) $fetch["komplex"];
                foreach($char["vorteile"] as $vorteil){
    //                print_r($vorteil);
                    if($vorteil["value"] == "Kampf" && preg_match("/(Nah|Fern)kampf/",$fetch["talentgruppe"]) || $vorteil["value"] == $fetch["talentgruppe"]){
                        $fetch["komplex"] .= + $vorteil["modifikator"];
                    }
                    if($vorteil["value"] == $talent["name"]){
                        $fetch["komplex"] .= + $vorteil["modifikator"];
                    }
                }
                if($fetch["komplex"] < 0){
                    $fetch["komplex"] = 0;
                }
                else if($fetch["komplex"] > 8){
                    $fetch["komplex"] = 8;
                }
                $pdoobj = $pdo->query("SELECT * FROM steigerungstabelle WHERE stufe =".$talent["stufe"]." AND komplex=".$fetch["komplex"]);
                $steigerung = $pdoobj->fetch(PDO::FETCH_ASSOC);
                $pdo->query("INSERT INTO charakter_talente(talent, stufe, aktuell, gesamt_frei, gesamt_se, gesamt_erlaubnis, charakter, timestamp) VALUES (".$fetch["id"].",".$talent["stufe"].",0,".(int)$steigerung["frei"].",".(int)$steigerung["se"].",".(int)$steigerung["erlaubnis"].",".$id.",".time().")");
    //            print_r($pdo->errorInfo());
            }
            
        }
        foreach($char["zauber"] as $zauber){
            
            $pdoobj= $pdo->query("SELECT id,komplex,merkmal FROM zauber WHERE name='".$zauber["name"]."'");
            $fetch = $pdoobj->fetch(PDO::FETCH_ASSOC);
            if($_POST["action"] == "update"){
                $pdoobj = $pdo->query("SELECT id FROM charakter_zauber WHERE zauber=".$fetch["id"]." AND charakter=".$id);
//                var_dump($pdo);
                $test = $pdoobj->fetch(PDO::FETCH_ASSOC);
//                var_dump($test);
            }
            if(!$test){
                $fetch["komplex"] = (int) $fetch["komplex"];
            $merkmale = explode(";", $fetch["merkmal"]);
            foreach($char["vorteile"] as $vorteil){
                if($vorteil["value"] == "Viertelzauberer"){
                    $fetch["komplex"] = 6;
                    $v = true;
                    $rep = "true";
                }
                else{
                    $v = false;
                }
                foreach($merkmale as $merkmal){
                    if($vorteil["value"] == $merkmal){
                        $fetch["komplex"] .= + $vorteil["modifikator"];
                    }
                }
                if($vorteil["value"] == $zauber["name"]){
                    $fetch["komplex"] .= + $vorteil["modifikator"];
                }
            }
            foreach($char["sonderfertigkeiten"] as $sonderfertigkeit){
                foreach($merkmale as $merkmal){
                    if($sonderfertigkeit == $merkmal){
                        $fetch["komplex"] .= + $vorteil["modifikator"];
                    }
                }
                if(preg_match("/Achaz|Borbaradianer|Druide|Elf|Geode|Hexe|Schelm|Magier|Scharlatan/") && $sonderfertigkeit != $zauber["rep"] && !$v){
                    $fetch["komplex"] .= +2;
                    $rep = "false";
                }
                else{
                    $rep = "true";
                }
            }
            if($zauber["hauszauber"] == "true"){
                $fetch["komplex"]--;
            }
            if($fetch["komplex"] < 0){
                $fetch["komplex"] = 0;
            }
            else if($fetch["komplex"] > 8){
                $fetch["komplex"] = 8;
            }
            $pdoobj = $pdo->query("SELECT * FROM steigerungstabelle WHERE stufe =".$zauber["stufe"]." AND komplex=".$fetch["komplex"]);
            $steigerung = $pdoobj->fetch(PDO::FETCH_ASSOC);
            $pdo->query("INSERT INTO charakter_zauber(zauber, stufe, hauszauber, rep, aktuell, gesamt_frei, gesamt_se, gesamt_erlaubnis, charakter, timestamp) VALUES (".(int)$fetch["id"].",".$zauber["stufe"].",'".$zauber["hauszauber"]."','".$rep."',0,".(int)$steigerung["frei"].",".(int)$steigerung["se"].",".(int)$steigerung["erlaubnis"].",".$id.",".time().")");
//            print_r($pdo->errorInfo());
            }
        }
    }
    header("location: localhost/Steigerungserlaubnisskalkulator/upload.php");
    exit(1);
}
?>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title></title>
</head>
<body>
    <form name="form_upload" id="form_upload" action="upload.php" method="POST" enctype="multipart/form-data">
        <input type="file" name="datei" id="datei" value="" />
        <!--<input type="submit" value="upload" name="submit" />-->
        <input type="hidden" name="upload" value="upload" />
        <input type="hidden" id="action" name="action" value="new" />
        <input type="hidden" id="id" name="id" value="0" />
    </form>
    <script type="text/javascript">
        var file = document.getElementById("datei");
        file.addEventListener("change",function(e){
            document.form_upload.submit();
            parent.wait();
        });
</script>
</body>
</html>