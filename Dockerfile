FROM python:3.10-slim

# Install uv
RUN pip install uv

# 작업 디렉토리 설정
WORKDIR /app

# 의존성 파일 및 소스 코드 복사
COPY uv.lock pyproject.toml server.py /app/

# 의존성 설치
RUN uv sync

# 포트 노출
EXPOSE 8080

# 애플리케이션 실행
CMD ["uv", "run", "server.py"]