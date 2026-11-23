CREATE TABLE ticket_history (
    id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    ticket_id BIGINT NOT NULL REFERENCES tickets(id),
    changed_by BIGINT NOT NULL REFERENCES users(id),
    field_name VARCHAR(40) NOT NULL,
    old_value VARCHAR(255),
    new_value VARCHAR(255),
    created_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE INDEX idx_ticket_history_ticket_id ON ticket_history (ticket_id);