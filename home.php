<?php

class Home extends Controller {

	protected
		$me;

	function beforeRoute($f3) {
		if ( ! $f3->exists('SESSION.id',$id)) $f3->reroute('/logout');
		$me = new \User;
		$me->id($id)->reroute('/logout');
		$f3->set('me',$me);
		$f3->set('content','home.html');
		$this->me = $me;
	}

	function Index($f3) {
		$f3->reroute('/home/setting');
	}

	function Setting($f3) {
		$f3->set('subcontent','setting.html');
	}

	function NewPass($f3) {
		$me = $this->me;
		if ( ! Check::pass($f3->get('POST.oldpass'), $me->password)) {
			$this->flash('Wrong Password');
		} elseif ( ! Check::confirm('POST.password')) {
			$this->flash('Confirm Password Mismatch');
		} elseif ( ! $f3->exists('POST.password',$pass)) {
			$this->flash('Password Can not be Empty');
		} else {
			$me->password = $pass;
			/*$me->save();*/
			$this->flash('Change Password Success','success');
		}
		$f3->reroute($f3->get('URI'));
	}

}