using Toybox.WatchUi as Ui;

class MovingTimeView extends Ui.SimpleDataField {

	var time_hours;
	var time_mins;
	var time_secs;
	var time_fmt;

	//! Set the label of the data field here.
	function initialize() {
		SimpleDataField.initialize();
		label = "MOVING";
		time_hours = 0;
		time_mins = 0;
		time_secs = 0;
		time_fmt = "00:00";
	}

	//! The given info object contains all the current workout
	//! information. Calculate a value and return it in this method.
	function compute(info) {

		// only update the data if we are currently moving
		if (info.currentSpeed == null || info.currentSpeed == 0) {
			return time_fmt;
		}

		// NOTE: we assume that we execute one each second, additional
		//       logic will be needed if that is not the case

		// update the time counters
		time_secs++;
		if (time_secs >= 60) {
			time_mins++;
			time_secs = 0;
		}
		if (time_mins >= 60) {
			time_hours++;
			time_mins = 0;
		}

		// format the time counter into a string format
		time_fmt = time_mins.format("%02d") + ":" +
			   time_secs.format("%02d");
		if (time_hours > 0) {
			time_fmt = time_hours.format("%02d") + ":" + time_fmt;
		}

		return time_fmt;
	}

}