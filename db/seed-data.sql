USE livrai;

-- Utilisateurs
INSERT INTO users (email, password_hash, role) VALUES
('admin@livrai.fr', '$2a$10$L3p7o8X8r6k1QO9K1m5u0uGgM8Kz7V9vDumgJk1Uo8n7KxYei5bYm', 'ADMIN'),
('commercial@livrai.fr', '$2a$10$L3p7o8X8r6k1QO9K1m5u0uGgM8Kz7V9vDumgJk1Uo8n7KxYei5bYm', 'COMMERCIAL'),
('livraison@livrai.fr', '$2a$10$L3p7o8X8r6k1QO9K1m5u0uGgM8Kz7V9vDumgJk1Uo8n7KxYei5bYm', 'LIVRAISON'),
('client1@livrai.fr', '$2a$10$L3p7o8X8r6k1QO9K1m5u0uGgM8Kz7V9vDumgJk1Uo8n7KxYei5bYm', 'CLIENT'),
('client2@livrai.fr', '$2a$10$L3p7o8X8r6k1QO9K1m5u0uGgM8Kz7V9vDumgJk1Uo8n7KxYei5bYm', 'CLIENT');

-- Clients
INSERT INTO customers (user_id, first_name, last_name, company_name, phone, address) VALUES
(4, 'Alice', 'Martin', 'Mairie de Nantes', '0601020304', '15 rue de la République, Nantes'),
(5, 'Lucas', 'Bernard', 'Atelier B', '0611223344', '8 avenue des Forges, Saint-Herblain');

-- Livraisons
INSERT INTO deliveries (customer_id, created_by_user_id, delivery_date, pickup_address, delivery_address, weight, status, amount) VALUES
(1, 2, '2026-09-15 09:30:00', '12 quai de la Loire, Nantes', '15 rue de la République, Nantes', 12.500, 'PENDING', 120.00),
(2, 4, '2026-09-16 10:00:00', '8 avenue des Forges, Saint-Herblain', '24 boulevard de l''Europe, Nantes', 18.750, 'ACCEPTED', 95.00),
(1, 2, '2026-09-17 08:15:00', '10 rue du Commerce, Nantes', '3 boulevard des Alpes, Nantes', 15.200, 'DELIVERED', 140.00),
(2, 2, '2026-09-18 14:00:00', '5 rue Saint-Pierre, Nantes', '40 rue de l''Eglise, Rezé', 6.900, 'REFUSED', 0.00);

-- Historique des statuts
INSERT INTO delivery_history (delivery_id, changed_by_user_id, previous_status, new_status, comment, changed_at) VALUES
(1, 2, NULL, 'PENDING', 'Création de la livraison', '2026-09-15 09:30:00'),
(2, 4, NULL, 'PENDING', 'Création de la livraison par le client', '2026-09-15 11:00:00'),
(2, 2, 'PENDING', 'ACCEPTED', 'Livraison acceptée par le service commercial', '2026-09-16 10:00:00'),
(3, 2, NULL, 'PENDING', 'Création de la livraison par le service commercial', '2026-09-16 11:00:00'),
(3, 2, 'PENDING', 'ACCEPTED', 'Livraison acceptée par le service commercial', '2026-09-16 11:02:00'),
(3, 3, 'ACCEPTED', 'DELIVERED', 'Livraison effectuée', '2026-09-17 08:15:00'),
(4, 2, NULL, 'PENDING', 'Création de la livraison par le client', '2026-09-17 09:30:00'),
(4, 2, 'PENDING', 'REFUSED', 'Demande refusée par le service commercial - ', '2026-09-18 14:00:00');

-- Factures
INSERT INTO invoices (delivery_id, issued_by_user_id, invoice_number, total_amount, status, issued_at, paid_at) VALUES
(2, 2, 'INV-2026-0001', 95.00, 'ISSUED', '2026-09-16 11:00:00', NULL),
(3, 2, 'INV-2026-0002', 140.00, 'PAID', '2026-09-17 09:00:00', '2026-09-18 10:00:00');
