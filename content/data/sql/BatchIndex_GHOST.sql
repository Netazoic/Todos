--Create a set of DO records for the primary ghost.posts table
/*
 * Todos Canonical records are from 0 - 999
 * TAG records start at 1000
 * DO records start at 10000
 */
/*
DELETE FROM do WHERE doid is null OR doid > 10000;
DELETE FROM do_do WHERE doRelID > 10000;
SELECT * FROM do;
SELECT * FROM do_do;
*/
-- rollback transaction;

begin transaction;

INSERT INTO DO (doID,doRecID,doRecUUID,dcCode)
SELECT id + 10000 as doID,id,uuid, 'DO' as dcCode
FROM posts;


-- Tags
INSERT INTO DO(doID,doRecID,doRecUUID,dcCode)
SELECT id + 1000 as doID, id,uuid,'TAG' as dcCode
FROM tags;

commit transaction;

