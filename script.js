var tabs = null;
function ze(gruppe,id){
    $("#form_ze_name").html($("#"+gruppe+"-"+id+"-name").html());
    $("#form_ze_aktuell").html($("#"+gruppe+"-"+id+"-aktuell").html());
    $("#form_ze_frei").html($("#"+gruppe+"-"+id+"-frei").html());
    $("#form_ze_se").html($("#"+gruppe+"-"+id+"-se").html());
    $("#form_ze_erlaubnis").html($("#"+gruppe+"-"+id+"-erlaubnis").html());
    $("#input_ze_id").val(id);
    $("#input_ze_gruppe").val(gruppe);
    $("#dialog_ze").dialog("open");
    var width = $("#table_ze").width()+35;
    if(width < 450){width = 450;}
    $("#dialog_ze").dialog("option","width",width);
}
function add(){
    var gruppe = $("#input_ze_gruppe").val();
        var id = $("#input_ze_id").val();
        var add = $("#input_ze_add").val();
        add = add.replace(/,/,".");
        var aktuell = $("#form_ze_aktuell").html();
        aktuell = aktuell.replace(/,/,".");
        var ze_neu = parseFloat(aktuell)+parseFloat(add);
        $.ajax({
            type: "POST",
            url: "ajax.php",
            data: "action=update&gruppe="+gruppe+"&id="+id+"&ze="+ze_neu
        });

//                            alert(ze_neu);
        ze_neu = ze_neu.toString().replace(/\./,",");
        $("#"+gruppe+"-"+id+"-aktuell").html(ze_neu.toString());
        $("#dialog_ze").dialog("close");
}
function del(id,tab_id){
    $("#input_del_id").val(id);
    $("#input_del_tab_id").val(tab_id);
    $("#dialog_del").dialog("open");
}
function wait(){
    $("#dialog_wait").dialog("open");
    window.setTimeout(function(){window.location.reload();},6300);
//                
}
function reset(form){
    document.getElementById(form).reset();
}
$(document).ready(function(){
    tabs = $("#tabs").tabs();
    $("#input_ze_add").spinner({
        min: 0
    });
    $("#dialog_ze").dialog({
        autoOpen: false,
        width: 1000,
        buttons: [
            {
                text: "Steigern frei",
                click: function(){
                    var gruppe = $("#input_ze_gruppe").val();
                    var id = $("#input_ze_id").val();
                    var aktuell = $("#form_ze_aktuell").html();
                    aktuell = aktuell.replace(/,/,".");
                    var ze_neu = parseFloat(aktuell)-parseFloat($("#form_ze_frei").html());
    //                            alert(ze_neu);
                    if(ze_neu >= 0){

                        $.ajax({
                            type: "POST",
    //                                    async: false,
                            url: "ajax.php",
                            data: "action=steigern&gruppe="+gruppe+"&id="+id+"&ze="+ze_neu,
                            success: function(xmlDocument){
    //                                        alert(xmlDocument);
                                var parser = new DOMParser();
                                var xmlDoc = parser.parseFromString(xmlDocument, "text/xml");
                                doc = xmlDoc;
                                $("#"+gruppe+"-"+id+"-aktuell").html(ze_neu.toString());
                                $("#"+gruppe+"-"+id+"-frei").html(doc.getElementsByTagName("frei")[0].innerHTML);
                                $("#"+gruppe+"-"+id+"-se").html(doc.getElementsByTagName("se")[0].innerHTML);
                                $("#"+gruppe+"-"+id+"-erlaubnis").html(doc.getElementsByTagName("erlaubnis")[0].innerHTML);
                            }
                        });

    //                            alert(ze_neu);
                        ze_neu = ze_neu.toString().replace(/\./,",");
                        $("#"+gruppe+"-"+id+"-aktuell").html(ze_neu.toString());
                        $(this).dialog("close");
                    }

                }
            },
            {
                text: "Steigern SE",
                click: function(){
                    var gruppe = $("#input_ze_gruppe").val();
                    var id = $("#input_ze_id").val();
                    var aktuell = $("#form_ze_aktuell").html();
                    aktuell = aktuell.replace(/,/,".");
                    var ze_neu = parseFloat(aktuell)-parseFloat($("#form_ze_se").html());
    //                            alert(ze_neu);
                    if(ze_neu >= 0){

                        $.ajax({
                            type: "POST",
    //                                    async: false,
                            url: "ajax.php",
                            data: "action=steigern&gruppe="+gruppe+"&id="+id+"&ze="+ze_neu,
                            success: function(xmlDocument){
    //                                        alert(xmlDocument);
                                var parser = new DOMParser();
                                var xmlDoc = parser.parseFromString(xmlDocument, "text/xml");
                                doc = xmlDoc;
                                $("#"+gruppe+"-"+id+"-aktuell").html(ze_neu.toString());
                                $("#"+gruppe+"-"+id+"-frei").html(doc.getElementsByTagName("frei")[0].innerHTML);
                                $("#"+gruppe+"-"+id+"-se").html(doc.getElementsByTagName("se")[0].innerHTML);
                                $("#"+gruppe+"-"+id+"-erlaubnis").html(doc.getElementsByTagName("erlaubnis")[0].innerHTML);
                            }
                        });

    //                            alert(ze_neu);
                        ze_neu = ze_neu.toString().replace(/\./,",");
                        $("#"+gruppe+"-"+id+"-aktuell").html(ze_neu.toString());
                        $(this).dialog("close");
                    }

                }
            },
            {
                text: "Steigern Erlaubnis",
                click: function(){
                    var gruppe = $("#input_ze_gruppe").val();
                    var id = $("#input_ze_id").val();
                    var aktuell = $("#form_ze_aktuell").html();
                    aktuell = aktuell.replace(/,/,".");
                    var ze_neu = parseFloat(aktuell)-parseFloat($("#form_ze_erlaubnis").html());
    //                            alert(ze_neu);
                    if(ze_neu >= 0){
                        $.ajax({
                            type: "POST",
    //                                    async: false,
                            url: "ajax.php",
                            data: "action=steigern&gruppe="+gruppe+"&id="+id+"&ze="+ze_neu,
                            success: function(xmlDocument){
    //                                        alert(xmlDocument);
                                var parser = new DOMParser();
                                var xmlDoc = parser.parseFromString(xmlDocument, "text/xml");
                                doc = xmlDoc;
                                $("#"+gruppe+"-"+id+"-aktuell").html(ze_neu.toString());
                                $("#"+gruppe+"-"+id+"-frei").html(doc.getElementsByTagName("frei")[0].innerHTML);
                                $("#"+gruppe+"-"+id+"-se").html(doc.getElementsByTagName("se")[0].innerHTML);
                                $("#"+gruppe+"-"+id+"-erlaubnis").html(doc.getElementsByTagName("erlaubnis")[0].innerHTML);
                            }
                        });

    //                            alert(ze_neu);
                        ze_neu = ze_neu.toString().replace(/\./,",");
                        $("#"+gruppe+"-"+id+"-aktuell").html(ze_neu.toString());
                        $(this).dialog("close");
                    }
                }
            }
        ],
        close: function(){
            $(this).dialog("option","width",1000);
            reset("form_ze");
        }
    });
    $("#dialog_wait").dialog({
        autoOpen: false,
        width: 150
    });
    $("#dialog_del").dialog({
        autoOpen: false,
        width: 200,
        buttons: [
            {
                text: "Ja",
                click: function(){
                    var id = $("#input_del_id").val();
                    var tab_id = $("#input_del_tab_id").val();
                    $.ajax({
                        type: "POST",
                        url: "ajax.php",
                        data: "action=del&id="+id
                    });
                    var panelId = $("#"+tab_id).closest("li").remove().attr("aria-controls");
                    $("#" + panelId).remove();
                    tabs.tabs("refresh");
                    $(this).dialog("close");
                }
            },
            {
                text: "Nein",
                click: function(){
                    $(this).dialog("close");
                }
            }
        ]
    });
    $("#button_ze_add").click(function(e){
        add();
        e.preventDefault();
    });
});