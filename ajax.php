<?php

include 'connect.php';

$id = (int) $_POST["id"];
$ze = (float) $_POST["ze"];
//var_dump($ze);
switch($_POST["gruppe"]){
    case "eigenschaft":
        $gruppe = "eigenschaften";
        break;
    case "talent":
        $gruppe = "talente";
        break;
    case "zauber":
        $gruppe = "zauber";
}
if($_POST["action"] == "update" || $_POST["action"] == "steigern"){
    $pdo->query("UPDATE charakter_".$gruppe." SET aktuell=".$ze." WHERE id=".$id);
//    var_dump($pdo->errorInfo());
}
if($_POST["action"] == "steigern" && isset($gruppe)){
    if($gruppe == "eigenschaften"){
        $data_id = "name ";
    }
    if($gruppe == "talente"){
        $data_id = "talent ";
    }
    if($gruppe == "zauber"){
        $data_id = "zauber,hauszauber,rep ";
    }
    $pdoobj= $pdo->query("SELECT stufe, charakter, ".$data_id."FROM charakter_".$gruppe." WHERE id=".$id);
    $fetch = $pdoobj->fetch(PDO::FETCH_ASSOC);
    $fetch["stufe"]++;
    if($fetch["stufe"] > 32){
        exit();
    }
    if($gruppe != "eigenschaften"){
        if($gruppe == "talente"){
            $data_id = "talentgruppe";
        }
        else{
            $data_id = "merkmal";
        }
        $pdoobj = $pdo->query("SELECT name,komplex,".$data_id." FROM ".$gruppe." WHERE id=".$id);
        $fetch1 = $pdoobj->fetch(PDO::FETCH_ASSOC);
        $fetch1["komplex"] = (int) $fetch1["komplex"];
        $pdoobj = $pdo->query("SELECT value,modifikator FROM vorteile WHERE charakter=".$fetch["charakter"]);
        $vorteile = $pdoobj->fetchAll(PDO::FETCH_ASSOC);
        foreach($vorteile as $vorteil){
            if(isset($fetch1["talentgruppe"]) && $vorteil["value"] == "Kampf" && preg_match("/(Nah|Fern)kampf/",$fetch1["talentgruppe"]) || isset($fetch1["talent"]) && $vorteil["value"] == $fetch["talentgruppe"]){
                $fetch1["komplex"] .= + $vorteil["modifikator"];
            }
            if(isset($fetch1["merkmal"])){
                if($vorteil["value"] == "Viertelzauberer"){
                    $fetch1["komplex"] = 6;
                }
                $merkmale = explode(";", $fetch1["merkmal"]);
                foreach($merkmale as $merkmal){
                    if($vorteil["value"] == $merkmal){
                        $fetch1["komplex"] .= + $vorteil["modifikator"];
                    }
                }
                if($fetch["hauszauber"] == "true"){
                    $fetch1["komplex"]--;
                }
            }
            if($vorteil["value"] == $fetch1["name"]){
                $fetch1["komplex"] .= + $vorteil["modifikator"];
            }
        }
        if(isset($fetch1["merkmal"])){
            if($fetch["rep"] == "false"){
               $fetch["komplex"] .= +2;
            }
            $pdoobj = $pdo->query("SELECT merkmal FROM sonderfertigkeiten WHERE charakter=".$fetch["charakter"]);
            $sonderfertigkeiten = $pdoobj->fetchAll(PDO::FETCH_ASSOC);
            foreach($sonderfertigkeiten as $sonderfertigkeit){
                $merkmale = explode(";", $fetch1["merkmal"]);
                foreach($merkmale as $merkmal){
                    if($sonderfertigkeit["merkmal"] == $merkmal){
                        $fetch1["komplex"]--;
                    }
                }
            }
        }
        if($fetch1["komplex"] < 0){
            $fetch1["komplex"] = 0;
        }
        else if($fetch1["komplex"] > 8){
            $fetch1["komplex"] = 8;
        }
    }
    else if($fetch["name"] == "Ausdauer"){
        $fetch1 = array("komplex" => 5);
    }
    else{
        $fetch1 = array("komplex" => 8);
    }
    $pdoobj = $pdo->query("SELECT * FROM steigerungstabelle WHERE stufe=".$fetch["stufe"]." AND komplex=".$fetch1["komplex"]);
    $steigerung = $pdoobj->fetch(PDO::FETCH_ASSOC);
    $pdo->query("UPDATE charakter_".$gruppe." SET stufe=".$fetch["stufe"].", gesamt_frei=".$steigerung["frei"].", gesamt_se=".$steigerung["se"].", gesamt_erlaubnis=".$steigerung["erlaubnis"]." WHERE id=".$id);
    echo "<?xml version=\"1.0\" encoding=\"UTF-8\"?>
        <root>
        <frei>".$steigerung["frei"]."</frei>
        <se>".$steigerung["se"]."</se>
        <erlaubnis>".$steigerung["erlaubnis"]."</erlaubnis>
        </root>";
}
if($_POST["action"] == "del"){
    $pdo->query("DELETE FROM charaktere WHERE id=".$id.";DELETE FROM charakter_eigenschaften WHERE charakter=".$id.";DELETE FROM charakter_talente WHERE charakter=".$id.";DELETE FROM charakter_zauber WHERE charakter=".$id.";DELETE FROM sonderfertigkeiten WHERE charakter=".$id.";DELETE FROM voteile WHERE charakter=".$id.";");
}