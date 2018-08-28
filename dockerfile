FROM microsoft/dotnet:2.1-sdk as build
WORKDIR /app

COPY *.csproj ./
RUN dotnet restore

EXPOSE 80


COPY . ./
RUN dotnet publish -c release -o out
ENTRYPOINT ["dotnet","out/docker-dotnetcore.dll"]
