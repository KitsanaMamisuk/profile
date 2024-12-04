up:
	docker-compose up -d

run-backend:
	docker-compose up -d django
	docker-compose exec django sh -c "pip install -r requirements.txt && python manage.py migrate && uvicorn --host 0.0.0.0 --reload main.asgi:application"

run-fronrend:
	docker-compose up -d react
	