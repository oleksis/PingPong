# syntax=docker/dockerfile:1

# Use the official ASP.NET Core SDK image to build the app
FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build
ARG TARGETARCH=x64

WORKDIR /src
COPY . /src
RUN dotnet publish -a x64 -c Release --use-current-runtime --self-contained false -o /app

# Copy the published app to the runtime image
FROM mcr.microsoft.com/dotnet/aspnet:7.0 AS final
ENV ASPNETCORE_ENVIRONMENT=Development
WORKDIR /app
EXPOSE 80
COPY --from=build /app .
ENTRYPOINT ["dotnet", "PingPongApi.dll"]
