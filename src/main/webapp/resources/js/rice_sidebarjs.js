/**
 * riceFw sidebar process javascript file
 */

var authId;
var memnum;
var memName;
var authName;

function setmemNum(val) {
	memnum = val;
}
function setmemName(val) {
	memName = val;
}
function setauthId(val) {
	authId = val;
}

function setauthName() {
	if(authId == 1000) {
		authName="관리자";
	} else if(authId == 1001) {
		authName="학생";
	} else {
		authName="강사";
	}
}

