const saps = [
	"Energy_1_1.sap",
	"Energy_1_2.sap",
	"Energy_1_3.sap",
	"Energy_1_4.sap",
	"Energy_1_5.sap",
	"Energy_2_1.sap",
	"Energy_2_2.sap",
	"Energy_2_3.sap",
	"Energy_2_4.sap",
	"Energy_2_5.sap",
	"Energy_2_6.sap",
	"Energy_2_7.sap",
	"Energy_2_8.sap",
	"Energy_2_9.sap",
	"Energy_2_10.sap",
	"Energy_2_11.sap",
	"Energy_2_12.sap"
];

var sap_id = 0;

function asap_update()
{
	const info = asapWeb.asap.getInfo();
	document.getElementById("asap_name").innerHTML = info.getTitle();
	document.getElementById("asap_author").innerHTML = info.getAuthor();
	document.getElementById("asap_panel").style.display = "";
}

function asap_set_pause_img(paused)
{
	document.getElementById("asap_pause_img").src = paused ? "asap/img/play.gif" : "asap/img/pause.gif";
}

function asap_play(i)
{
	document.getElementById("music" + sap_id).className = "music";
	document.getElementById("music" + i).className = "musicselected";
	sap_id = i;
	asapWeb.onUpdate = asap_update;
	asapWeb.playUrl("asap/" + saps[i]);
	asap_set_pause_img(false);
}

function asap_pause()
{
	asap_set_pause_img(asapWeb.togglePause());
}

function asap_stop()
{
	document.getElementById("music" + sap_id).className = "music";
	document.getElementById("asap_panel").style.display = "none";
	asapWeb.stop();
}

function asap_prev()
{
	asap_play((sap_id + saps.length - 1) % saps.length);
}

function asap_next()
{
	asap_play((sap_id + 1) % saps.length);
}
