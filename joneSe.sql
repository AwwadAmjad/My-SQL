SELECT sender.firstName, sender.lastName, sender.email ,sender.phone , address.streetName, address.city FROM sender 
JOIN address ON sender.fk_adress_Id= address.id



SELECT post.CompanyOfship, post.dateOfship, post.PacketNummber ,post.State, sender.firstName, sender.lastName,sender.email  FROM post
JOIN packet on packet.fk_post_Id= post.id
JOIN sender on packet.fk_sender_Id = sender.id

SELECT receiver_land.arrivd_packet , receiver_land.Zoll ,receiver_land.city, bigstorehouse.available ,local_post.name, receiver.firstName, receiver.lastName FROM bigstorehouse
JOIN receiver_land on bigstorehouse.fk_receiver_id = receiver_land.id
JOIN local_post on receiver_land.fk_local_post = local_post.id
JOIN receiver on local_post.fk_receiver = receiver.id






SELECT sender.firstName ,sender.lastName, post.CompanyOfship, bigstorehouse.available, receiver_land.Zoll ,receiver_land.city, local_post.name, receiver.firstName, receiver.lastName, receiver.phone, s_addrese.R_streetName,
s_addrese.R_city,s_addrese.R_country FROM sender
JOIN packet on packet.fk_sender_Id = sender.id 
JOIN post on packet.fk_post_Id = post.id
JOIN bigstorehouse on post.fk_bigStoreHouse = bigstorehouse.id
JOIN receiver_land on bigstorehouse.fk_receiver_id = receiver_land.id
JOIN local_post on receiver_land.fk_local_post = local_post.id
JOIN receiver on local_post.fk_receiver = receiver.id 
JOIN s_addrese on receiver.S_addrese_id = s_addrese.id