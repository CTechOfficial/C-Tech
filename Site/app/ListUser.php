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
					'nom' => $var->{'NOM'},
					'prenom' => $var->{'PRENOM'}
				);
			}
		}

		return $rtn[$class];
	}

}
