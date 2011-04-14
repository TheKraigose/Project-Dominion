function SpawnItem(objtype, x, y)
	objecttemp.x = x - math.floor(x % 32)
	objecttemp.y = y - math.floor(y % 32)
	if objtype == 50 then
		objecttemp.hp = 0
		objecttemp.rot = 0
		objecttemp.thingType = 50		-- Make it a submachine gun
		objecttemp.sprIndex = 1
		objecttemp.isenemy = false
		objecttemp.isboss = false
		objecttemp.ismoving = false
		objecttemp.spr = sprTable["gun1"]["norm"]
	elseif objtype == 51 then
		objecttemp.hp = 0
		objecttemp.rot = 0
		objecttemp.thingType = 51		-- Make it a submachine gun
		objecttemp.sprIndex = 1
		objecttemp.isenemy = false
		objecttemp.isboss = false
		objecttemp.ismoving = false
		objecttemp.spr = sprTable["ammo1"]["norm"]
	end
	table.insert(objects, objecttemp)
	objecttemp = {}
end

-- Fire a friendly bullet (cannot hurt shooter)
function A_FirePlayerBullet(typeOfBul)
	objecttemp.x = hero.x
	objecttemp.y = hero.y
	objecttemp.rot = hero.rot
	objecttemp.sprIndex = 1
	objecttemp.thingType = 512
	objecttemp.isPlayerBullet = true
	objecttemp.isenemy = false
	objecttemp.isboss = false
	objecttemp.ismoving = false
	if typeOfBul == 1 or typeOfBul == 2 then
		objecttemp.spr = sprTable["bullet"]["norm"]
	end
	table.insert(objects, objecttemp)
	objecttemp = {}
end

function A_BulletAttack(typeOfBul, x, y, rot)
	objecttemp.x = x
	objecttemp.y = y
	objecttemp.rot = rot
	objecttemp.sprIndex = 1
	objecttemp.thingType = 520
	objecttemp.isEnemyBullet = true
	objecttemp.isenemy = false
	objecttemp.isboss = false
	objecttemp.ismoving = false
	if typeOfBul == 1 or typeOfBul == 2 then
		objecttemp.spr = sprTable["bullet"]["norm"]
	end
	table.insert(objects, objecttemp)
	objecttemp = {}
end