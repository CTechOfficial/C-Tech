<?php

namespace App;

class ListUser extends Model {


	public static $_table   = 'utilisateur';
	

	public static function getListUser()
	{


		static $rtn = array();
		$class = get_called_class();
		
		if (!isset($rtn[$class])) {
			$vars = Model::factory(get_called_class())
				->find_many();
			
			$rtn[$class] = array();
			foreach($vars as $var)
			{
				$rtn[$class][$var->{'ID'}] = array(
					'id' => $var->{'ID'},
					'mail' => $var->{'MAIL'},
					'nom' => $var->{'NOM'},
					'prenom' => $var->{'PRENOM'},
					'password' => $var->{'PASSWORD'}
				);
			}
		}

		return $rtn[$class];
	}

	public function updatePassword($id, $mdp){
		$results = ORM::for_table('utilisateur')->where('ID', $id);
		$results->PASSWORD = $mdp;
		$results->save();
	}

}
