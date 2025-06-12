import pytest
from app import app  # Importe sua aplicação

@pytest.fixture
def client():
    app.config['TESTING'] = True
    app.config['SECRET_KEY'] = 'testsecretkey'
    with app.test_client() as client:
        yield client

def test_index_redirects_to_login(client):
    response = client.get('/')
    assert response.status_code == 302
    assert b'login' in response.data

def test_successful_login(client):
    expected_message = 'Você está logado no DevOpsGram.'.encode('utf-8')
    response = client.post('/login', data={'username': 'admin', 'password': 'admin'}, follow_redirects=True)
    assert response.status_code == 200
    assert expected_message in response.data