<?php
header("Content-Type: text/html; charset=utf-8");
header("Cache-control: no-cache, muat revalidate");
header("Pragma: no-cache, must-revalidate");
include 'connect.php';
?>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Steigerungserlaubniskalkulator</title>
        <link rel="stylesheet" type="text/css" href="jquery-ui.min.css">
        <link rel="stylesheet" type="text/css" href="jquery-ui.structure.min.css">
        <link rel="stylesheet" type="text/css" href="jquery-ui.theme.min.css">
        <script type="text/javascript" src="jquery-3.1.1.min.js"></script>
        <script type="text/javascript" src="jquery-ui.min.js"></script>
        <script type="text/javascript" src="script-min.js"></script>
        <style type="text/css">
            body{
                margin: 0px;
                margin-top: 5px;
            }
            #upload{
                display: none;
            }
        </style>
    </head>
    <body>
        <iframe src="upload.php" name="upload" id="upload"></iframe>
        <div id="dialog_wait">
            <center><img src="images/ajax-loader.gif"></center>
        </div>
        <div id="dialog_ze" title="Zeiteinheiten bearbeiten">
            <form id="form_ze">
                <table border="1" id="table_ze">
                    <thead>
                        <tr>
                            <th>Name</th>
                            <th>Aktuell</th>
                            <th>ZE Frei</th>
                            <th>ZE SE</th>
                            <th>ZE Erlaubnis</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td id="form_ze_name"></td>
                            <td id="form_ze_aktuell"></td>
                            <td id="form_ze_frei"></td>
                            <td id="form_ze_se"></td>
                            <td id="form_ze_erlaubnis"></td>
                        </tr>
                    </tbody>
                </table>
                    ZE hinzuf&uuml;gen
                <input type="text" value="" id="input_ze_add" size="6"/>
                <button class="ui-button ui-widget ui-corner-all" id="button_ze_add" >ZE hinzuf&uuml;gen</button>
                <input type="hidden" id="input_ze_id" value="" />
                <input type="hidden" id="input_ze_gruppe" value="" />
            </form>
        </div>
        <div id="dialog_del" title="löschen bestätigen">
            <center>Charakter löschen?</center>
            <input type="hidden" id="input_del_id" value="" />
            <input type="hidden" id="input_del_tab_id" value="" />
        </div>
        <center><h2>Steigerungserlaubnisskalkulator</h2></center>
        <input type="button" id="add_char" value="Charakter hinzufügen" onclick="parent.frames['upload'].document.form_upload.datei.click();"/>
        <?php
        $pdoobj = $pdo->query("SELECT id FROM charaktere");
        $fetch_id = $pdoobj->fetchAll(PDO::FETCH_ASSOC);
//        var_dump($fetch_id);
        $count_chars = count($fetch_id);
//        var_dump($count_chars);
        $chars = array();
        ?>
        <div id="tabs">
        <ul>
        <?php
        for($i = 0; $i < $count_chars;$i++){
            $n = $i+1;
            $pdoobj = $pdo->query("SELECT name FROM charaktere WHERE id=".$fetch_id[$i]["id"]);
            $fetch = $pdoobj->fetch(PDO::FETCH_ASSOC);
            $pdoobj = $pdo->query("SELECT * FROM charakter_eigenschaften WHERE charakter=".$fetch_id[$i]["id"]." ORDER BY id ASC");
//            print_r($pdo->errorInfo());
            $eigenschaften = $pdoobj->fetchAll(PDO::FETCH_ASSOC);
//            print_r($eigenschaften);
            $pdoobj = $pdo->query("SELECT * FROM charakter_talente WHERE charakter=".$fetch_id[$i]["id"]." ORDER BY id ASC");
//            print_r($pdo->errorInfo());
            $talente = $pdoobj->fetchAll(PDO::FETCH_ASSOC);
            $pdoobj = $pdo->query("SELECT * FROM charakter_zauber WHERE charakter=".$fetch_id[$i]["id"]." ORDER BY id ASC");
//            print_r($pdo->errorInfo());
            $zauber = $pdoobj->fetchAll(PDO::FETCH_ASSOC);
            $chars[] = array(
                "eigenschaften" => $eigenschaften,
                "talente" => $talente,
                "zauber" => $zauber
            );
            
        echo "<li id=\"".$n."\"><a href=\"#tabs-".$n."\">".$fetch["name"]."</a><span class=\"ui-icon ui-icon-circle-close\" onclick=\"del(".$fetch_id[$i]["id"].",".$n.")\"></span></li>\n";
        }
        ?>
        </ul>
        <?php
        for($i = 0;$i < $count_chars;$i++){
            $n = $i+1;
            echo "<div id=\"tabs-".$n."\">\n<a href='javascript:parent.frames[\"upload\"].document.form_upload.action.setAttribute (\"value\", \"update\");parent.frames[\"upload\"].document.form_upload.id.setAttribute (\"value\", ".$fetch_id[$i]["id"].");parent.frames[\"upload\"].document.form_upload.datei.click();'>Aktualisieren</a>\n";
            $n = 0;
            echo "<table border=\"1\">\n<thead>\n<tr>\n<th>Eigenschaften</th>\n<tr>\n</thead>\n<tbody>\n<tr>\n<td>\n<table border=\"1\">\n<thead>
                    <tr>
                        <th>Name</th>
                        <th>Aktuell</th>
                        <th>ZE Frei</th>
                        <th>ZE SE</th>
                        <th>ZE Erlaubnis</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>\n";
            foreach($chars[$i]["eigenschaften"] as $eigenschaft){
                $aktuell = preg_replace("/\./",",",(float) $eigenschaft["aktuell"]);
                echo "<tr>
                        <td id=\"eigenschaft-".$eigenschaft["id"]."-name\">".$eigenschaft["name"]."</td>
                        <td id=\"eigenschaft-".$eigenschaft["id"]."-aktuell\">".$aktuell."</td>
                        <td id=\"eigenschaft-".$eigenschaft["id"]."-frei\">".$eigenschaft["gesamt_frei"]."</td>
                        <td id=\"eigenschaft-".$eigenschaft["id"]."-se\">".$eigenschaft["gesamt_se"]."</td>
                        <td id=\"eigenschaft-".$eigenschaft["id"]."-erlaubnis\">".$eigenschaft["gesamt_erlaubnis"]."</td>
                        <td><button onclick=\"ze('eigenschaft',".$eigenschaft["id"].")\"><span class=\"ui-icon ui-icon-circle-plus\"></span></button></td>
                    </tr>\n";
            }
            echo "</tbody>\n</table>\n</tr>\n</tbody>\n</table>\n";
            $talentgruppen = array("Kampf","K&ouml;rperlich","Gesellschaft","Natur","Wissen","Sprachen und Schriften","Handwerk","&nbsp;");
            $talente = array();
            $talente[0] = array();
            $talente[1] = array();
            $talente[2] = array();
            $talente[3] = array();
            $talente[4] = array();
            $talente[5] = array();
            $talente[6] = array();
            $talente[7] = array();
            foreach($chars[$i]["talente"] as $talent){
                $pdoobj = $pdo->query("SELECT name,talentgruppe FROM talente WHERE id=".$talent["talent"]);
                $fetch = $pdoobj->fetch(PDO::FETCH_ASSOC);
                if(preg_match("/(Nah|Fern)kampf/", $fetch["talentgruppe"])){
                    $fetch["talentgruppe"] = "Kampf";
                }
                if($fetch["talentgruppe"] == "Lesen/Schreiben"){
                    $fetch["talentgruppe"] = "Sprache";
                }
                switch($fetch["talentgruppe"]){
                    case "Kampf":
                        $talente[0][] = array(
                            "id" => $talent["id"],
                            "name" => $fetch["name"],
                            "aktuell" => $talent["aktuell"],
                            "frei" => $talent["gesamt_frei"],
                            "se" => $talent["gesamt_se"],
                            "erlaubnis" => $talent["gesamt_erlaubnis"]
                        );
                        break;
                    case "K&ouml;rperlich":
                        $talente[1][] = array(
                            "id" => $talent["id"],
                            "name" => $fetch["name"],
                            "aktuell" => $talent["aktuell"],
                            "frei" => $talent["gesamt_frei"],
                            "se" => $talent["gesamt_se"],
                            "erlaubnis" => $talent["gesamt_erlaubnis"]
                        );
                        break;
                    case "Gesellschaft":
                        $talente[2][] = array(
                            "id" => $talent["id"],
                            "name" => $fetch["name"],
                            "aktuell" => $talent["aktuell"],
                            "frei" => $talent["gesamt_frei"],
                            "se" => $talent["gesamt_se"],
                            "erlaubnis" => $talent["gesamt_erlaubnis"]
                        );
                        break;
                    case "Natur":
                        $talente[3][] = array(
                            "id" => $talent["id"],
                            "name" => $fetch["name"],
                            "aktuell" => $talent["aktuell"],
                            "frei" => $talent["gesamt_frei"],
                            "se" => $talent["gesamt_se"],
                            "erlaubnis" => $talent["gesamt_erlaubnis"]
                        );
                        break;
                    case "Wissen":
                        $talente[4][] = array(
                            "id" => $talent["id"],
                            "name" => $fetch["name"],
                            "aktuell" => $talent["aktuell"],
                            "frei" => $talent["gesamt_frei"],
                            "se" => $talent["gesamt_se"],
                            "erlaubnis" => $talent["gesamt_erlaubnis"]
                        );
                        break;
                    case "Sprache":
                        $talente[5][] = array(
                            "id" => $talent["id"],
                            "name" => $fetch["name"],
                            "aktuell" => $talent["aktuell"],
                            "frei" => $talent["gesamt_frei"],
                            "se" => $talent["gesamt_se"],
                            "erlaubnis" => $talent["gesamt_erlaubnis"]
                        );
                        break;
                    case "Handwerk":
                        $talente[6][] = array(
                            "id" => $talent["id"],
                            "name" => $fetch["name"],
                            "aktuell" => $talent["aktuell"],
                            "frei" => $talent["gesamt_frei"],
                            "se" => $talent["gesamt_se"],
                            "erlaubnis" => $talent["gesamt_erlaubnis"]
                        );
                        break;
                    case "sonstige":
                        $talente[7][] = array(
                            "id" => $talent["id"],
                            "name" => $fetch["name"],
                            "aktuell" => $talent["aktuell"],
                            "frei" => $talent["gesamt_frei"],
                            "se" => $talent["gesamt_se"],
                            "erlaubnis" => $talent["gesamt_erlaubnis"]
                        );
                        break;              
                }
            }
            for($n = 0; $n < 8;$n++){
                if($n == 7 && empty($talente[7])){
                    break;
                }
                echo "<table border=\"1\">\n<thead>\n<tr>\n<th>".$talentgruppen[$n]."</th>\n</tr>\n</thead>\n<tbody>\n</tr>\n<td>\n<table border=\"1\">\n<thead>
                    <tr>
                        <th>Name</th>
                        <th>Aktuell</th>
                        <th>ZE Frei</th>
                        <th>ZE SE</th>
                        <th>ZE Erlaubnis</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>\n";
                foreach($talente[$n] as $talent){
//                   var_dump($talent);
                    echo "<tr id=\"talent-".$talent["id"]."\">
                        <td id=\"talent-".$talent["id"]."-name\">".$talent["name"]."</td>
                        <td id=\"talent-".$talent["id"]."-aktuell\">".$talent["aktuell"]."</td>
                        <td id=\"talent-".$talent["id"]."-frei\">".$talent["frei"]."</td>
                        <td id=\"talent-".$talent["id"]."-se\">".$talent["se"]."</td>
                        <td id=\"talent-".$talent["id"]."-erlaubnis\">".$talent["erlaubnis"]."</td>
                        <td><button onclick=\"ze('talent',".$talent["id"].")\"><span class=\"ui-icon ui-icon-circle-plus\"></span></button></td>  
                    </tr>\n";
                }
                echo "</tbody>\n</table>\n</tr>\n</tbody>\n</table>\n";
            }
            if(!empty($chars[$i]["zauber"])){
                echo "<table border=\"1\">\n<thead>\n<tr>\n<th>Zauber</th>\n<tr>\n</thead>\n<tbody>\n<tr>\n<td>\n<table border=\"1\">\n<thead>
                        <tr>
                            <th>Name</th>
                            <th>Aktuell</th>
                            <th>ZE Frei</th>
                            <th>ZE SE</th>
                            <th>ZE Erlaubnis</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>\n";
                foreach($chars[$i]["zauber"] as $zauber){
                    $pdoobj = $pdo->query("SELECT name FROM zauber WHERE id=".$zauber["zauber"]);
                    $fetch = $pdoobj->fetch(PDO::FETCH_ASSOC);
                    echo "<tr>
                            <td id=\"zauber-".$zauber["id"]."-name\">".$fetch["name"]."</td>
                            <td id=\"zauber-".$zauber["id"]."-aktuell\">".$zauber["aktuell"]."</td>
                            <td id=\"zauber-".$zauber["id"]."-frei\">".$zauber["gesamt_frei"]."</td>
                            <td id=\"zauber-".$zauber["id"]."-se\">".$zauber["gesamt_se"]."</td>
                            <td id=\"zauber-".$zauber["id"]."-erlaubnis\">".$zauber["gesamt_erlaubnis"]."</td>
                            <td><button onclick=\"ze('zauber',".$zauber["id"].")\"><span class=\"ui-icon ui-icon-circle-plus\"></span></button></td>    
                        </tr>\n";
                }
            echo "</tbody>\n</table>\n</tr>\n</tbody>\n</table>\n";
            }
            echo "</div>";
        }
        ?>
        </div>
    </body>
</html>