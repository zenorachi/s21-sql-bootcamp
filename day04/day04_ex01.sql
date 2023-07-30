SELECT vm.name AS name
FROM v_persons_male vm

UNION

SELECT vf.name AS name
FROM v_persons_female vf

ORDER BY name;