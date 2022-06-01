class HDColt1911_Spawner : EventHandler
{
override void CheckReplacement(ReplaceEvent e) {
	switch (e.Replacee.GetClassName()) {

case 'ClipBoxPickup' 			: if (!random(0,9)) {e.Replacement = "HDColt1911Spawn";} break;

  case 'ClipMagPickup' 			: if (!random(0,9)) {e.Replacement = "HDColtMagPickup";} break;


case 'HDColt1911RandomDrop' 			: if (!random(0,9)) {e.Replacement = "HDColt1911RandomDrop";} break;

		}
	e.IsFinal = false;
	}
}

class HDColtMagPickup:HDInvRandomSpawner{
	default{
		dropitem "HDColtMag7",256,8;
	}
}

class HDColt1911RandomDrop:RandomSpawner{
	default{
		dropitem "HDPistol",16,5;
		dropitem "HDColt1911",16,1;
	}
}

class HDColt1911Spawn:actor{
	override void postbeginplay(){
		super.postbeginplay();
		spawn("HDColt1911",pos,ALLOW_REPLACE);
  spawn("HDColtMag7",pos,ALLOW_REPLACE);
  spawn("HDColtMag7",pos,ALLOW_REPLACE);

		self.Destroy();
	}
}
