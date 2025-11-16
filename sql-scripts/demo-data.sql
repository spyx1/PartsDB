-- Categories
INSERT IGNORE INTO categories (name, parent_id) VALUES
('Passive Components', NULL),
('Resistors', 1),
('Capacitors', 1),
('Active Components', NULL),
('Integrated Circuits', 4),
('Transistors', 4);

-- Manufacturers
INSERT IGNORE INTO manufacturers (name, address) VALUES
('Texas Instruments', 'USA'),
('Murata', 'Japan'),
('Yageo', 'Taiwan'),
('STMicroelectronics', 'Switzerland'),
('ON Semiconductor', 'USA');

-- Demo Components
INSERT IGNORE INTO parts (name, description, id_category, id_manufacturer, ipn, manufacturer_product_number, favorite, needs_review, minamount, visible) VALUES
('Resistor 10k Ohm 0805', '10k Ohm resistor, 1% tolerance, 0805 package', 
 (SELECT id FROM categories WHERE name = 'Resistors'), 
 (SELECT id FROM manufacturers WHERE name = 'Yageo'), 
 'RES_10K_0805_1%', 'RC0805FR-0710KL', 0, 0, 10, 1),

('Resistor 1k Ohm 0603', '1k Ohm resistor, 5% tolerance, 0603 package', 
 (SELECT id FROM categories WHERE name = 'Resistors'), 
 (SELECT id FROM manufacturers WHERE name = 'Yageo'), 
 'RES_1K_0603_5%', 'RC0603JR-071KL', 0, 0, 10, 1),

('Capacitor 100nF 0805', 'Ceramic capacitor 100nF, 50V, X7R, 0805 package', 
 (SELECT id FROM categories WHERE name = 'Capacitors'), 
 (SELECT id FROM manufacturers WHERE name = 'Murata'), 
 'CAP_100N_0805_X7R', 'GRM21BR71H104KA01L', 0, 0, 10, 1)
