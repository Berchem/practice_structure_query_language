-- exercise 1
insert into birds_body_shapes
(body_id, body_shape)
values
('HUM', 'Hummingbird'),
('LLW', 'Long-Legged Wader'),
('MHN', 'Marsh Hen'),
('OWL', 'Owl'),
('PER', 'Perching Bird'),
('PWB', 'Perching Water Bird'),
('PGN', 'Pigeon'),
('RAP', 'Raptor'),
('SEA', 'Seabird'),
('SHO', 'Shore Bird'),
('SWA', 'Swallow'),
('TRE', 'Tree Clinging'),
('WFL', 'Waterfowl'),
('WLF', 'Woodland Fowl');

-- exercise 2
insert into birds_wing_shapes
(wing_id, wing_shape)
values
('BR', 'Broad'),
('RO', 'Rounded'),
('PO', 'Pointed'),
('TA', 'Tapered'),
('LN', 'Long'),
('VL', 'Very Long');

-- exercise 3
insert into birds_bill_shapes
(bill_id, bill_shape)
values
('AP', 'All Purpose'),
('CO', 'Cone'),
('CU', 'Curved'),
('DA', 'Dagger'),
('HO', 'Hooked'),
('HS', 'Hooked Seabird'),
('NE', 'Needle'),
('ST', 'Spatulate'),
('SC', 'Specialized');

-- exercise 4
select * from birds_body_shapes
where body_shape = 'Woodland Fowl';

replace into birds_body_shapes
(body_id, body_shape)
values ('WLF', 'Upland Ground Birds');
