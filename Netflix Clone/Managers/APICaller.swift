//
//  APICaller.swift
//  Netflix Clone
//
//  Created by Ensi Khosravi on 17.11.2023.
//

import Foundation

struct Constants {
    static let API_KEY = "6d24c829eff22b399e10a5aad3c9ad8b "
    static let baseURL = "https://api.themoviedb.org"
    static let YouTubeAPIKey = "AIzaSyBDjjzGa_yf0a5OBN8-YrA1iV3-jM-CFnU"
    static let YouTubeBaseURL = "https://youtube.googleapis.com/youtube/v3/search?"
}

enum APIError: Error {
    case failedTogetData
}

class APICaller {
    static let shared = APICaller()
    
    
    func getTrendingMovies(completion: @escaping (Result<[Title], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)/3/trending/movie/day?language=en-US") else { return }
        var request = URLRequest(url: url)
        request.allHTTPHeaderFields = [
            "accept": "application/json",
            "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI2ZDI0YzgyOWVmZjIyYjM5OWUxMGE1YWFkM2M5YWQ4YiIsInN1YiI6IjY1NGI4ZWYxMjg2NmZhMDEzOGE5Mzk2MiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.LXi66mIihy6NrF8_qU-zz44NtOXjINYsb0qf2F0DhAA"
        ]
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
                
            } catch {
                completion(.failure(APIError.failedTogetData))
            }
            
        }
        
        task.resume()
    }
    
    
    func getTrendingTvs(completion: @escaping (Result<[Title], Error>) -> Void) {
        guard let url = URL(string:  "\(Constants.baseURL)/3/trending/tv/day?language=en-US") else { return }
        var request = URLRequest(url: url)
        request.allHTTPHeaderFields = [
            "accept": "application/json",
            "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI2ZDI0YzgyOWVmZjIyYjM5OWUxMGE1YWFkM2M5YWQ4YiIsInN1YiI6IjY1NGI4ZWYxMjg2NmZhMDEzOGE5Mzk2MiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.LXi66mIihy6NrF8_qU-zz44NtOXjINYsb0qf2F0DhAA"
        ]
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
            } catch {
                completion(.failure(APIError.failedTogetData))
            }
            
        }
        task.resume()
    }
    
    
    func getUpcomingMovies(completion: @escaping (Result<[Title], Error>) -> Void) {
        guard let url = URL(string:  "\(Constants.baseURL)/3/movie/upcoming?language=en-US&page=1") else { return }
        var request = URLRequest(url: url)
        request.allHTTPHeaderFields = [
            "accept": "application/json",
            "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI2ZDI0YzgyOWVmZjIyYjM5OWUxMGE1YWFkM2M5YWQ4YiIsInN1YiI6IjY1NGI4ZWYxMjg2NmZhMDEzOGE5Mzk2MiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.LXi66mIihy6NrF8_qU-zz44NtOXjINYsb0qf2F0DhAA"
        ]
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
            } catch {
                completion(.failure(APIError.failedTogetData))
            }
            
        }
        task.resume()
    }
    
    
    func getPopular(completion: @escaping (Result<[Title], Error>) -> Void) {
        guard let url = URL(string:  "\(Constants.baseURL)/3/movie/popular?language=en-US&page=1") else { return }
        var request = URLRequest(url: url)
        request.allHTTPHeaderFields = [
            "accept": "application/json",
            "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI2ZDI0YzgyOWVmZjIyYjM5OWUxMGE1YWFkM2M5YWQ4YiIsInN1YiI6IjY1NGI4ZWYxMjg2NmZhMDEzOGE5Mzk2MiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.LXi66mIihy6NrF8_qU-zz44NtOXjINYsb0qf2F0DhAA"
        ]
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
            } catch {
                completion(.failure(APIError.failedTogetData))
            }
            
        }
        task.resume()
    }
    
    
    func getTopRated(completion: @escaping (Result<[Title], Error>) -> Void) {
        guard let url = URL(string:  "\(Constants.baseURL)/3/movie/popular?language=en-US&page=1") else { return }
        var request = URLRequest(url: url)
        request.allHTTPHeaderFields = [
            "accept": "application/json",
            "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI2ZDI0YzgyOWVmZjIyYjM5OWUxMGE1YWFkM2M5YWQ4YiIsInN1YiI6IjY1NGI4ZWYxMjg2NmZhMDEzOGE5Mzk2MiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.LXi66mIihy6NrF8_qU-zz44NtOXjINYsb0qf2F0DhAA"
        ]
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
            } catch {
                completion(.failure(APIError.failedTogetData))
            }
            
        }
        task.resume()
    }
    
    func getDiscoverMovies(completion: @escaping (Result<[Title], Error>) -> Void) {
        guard let url = URL(string:  "\(Constants.baseURL)/3/discover/movie?include_adult=false&include_video=false&language=en-US&page=1&sort_by=popularity.desc") else { return }
        var request = URLRequest(url: url)
        request.allHTTPHeaderFields = [
            "accept": "application/json",
            "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI2ZDI0YzgyOWVmZjIyYjM5OWUxMGE1YWFkM2M5YWQ4YiIsInN1YiI6IjY1NGI4ZWYxMjg2NmZhMDEzOGE5Mzk2MiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.LXi66mIihy6NrF8_qU-zz44NtOXjINYsb0qf2F0DhAA"
        ]
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
            } catch {
                completion(.failure(APIError.failedTogetData))
            }
            
        }
        task.resume()
    }
    
    func search(with query: String, completion: @escaping (Result<[Title], Error>) -> Void) {
        guard let query = query.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else { return }
        guard let url = URL(string: "\(Constants.baseURL)/3/search/movie?query=\(query)") else { return }
        var request = URLRequest(url: url)
        request.allHTTPHeaderFields = [
            "accept": "application/json",
            "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI2ZDI0YzgyOWVmZjIyYjM5OWUxMGE1YWFkM2M5YWQ4YiIsInN1YiI6IjY1NGI4ZWYxMjg2NmZhMDEzOGE5Mzk2MiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.LXi66mIihy6NrF8_qU-zz44NtOXjINYsb0qf2F0DhAA"
        ]
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
            } catch {
                completion(.failure(APIError.failedTogetData))
            }
        }
        task.resume()
    }
    
    func getMovie(with query: String, completion: @escaping (Result<VideoElement, Error>) -> Void) {
        guard let query = query.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else { return }
        guard let url = URL(string: "\(Constants.YouTubeBaseURL)q=\(query)&key=\(Constants.YouTubeAPIKey)") else { return }
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let results = try JSONDecoder().decode(YoutubeSearchResponse.self, from: data)
                completion(.success(results.items[0]))
            } catch {
                completion(.failure(APIError.failedTogetData))
            }
        }
        task.resume()
    }
}


    
