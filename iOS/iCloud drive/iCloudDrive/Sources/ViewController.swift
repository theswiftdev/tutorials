//
//  ViewController.swift
//  iCloudDrive
//
//  Created by Tibor Bödecs on 2018. 05. 17..
//  Copyright © 2018. Tibor Bödecs. All rights reserved.
//

import UIKit

struct Fruit: Codable {
    let name: String
}

class ViewController: UIViewController {
    
    var fruits: [Fruit] = [
        Fruit(name: "Apple 🍎"),
        Fruit(name: "Banana 🍌"),
        Fruit(name: "Pear 🍐"),
    ]

    var containerUrl: URL? {
        return FileManager.default.url(forUbiquityContainerIdentifier: nil)?.appendingPathComponent("Documents")
    }

    func ubiquitousJson(named name: String) -> URL? {
        return self.containerUrl?.appendingPathComponent(name).appendingPathExtension("json")
    }
    
    // MARK: - outlets

    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - view controller

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")

        // prepare iCloud drive folder
        if let url = self.containerUrl, !FileManager.default.fileExists(atPath: url.path, isDirectory: nil) {
            do {
                try FileManager.default.createDirectory(at: url, withIntermediateDirectories: true, attributes: nil)
            }
            catch {
                print(error.localizedDescription)
            }
        }
    }
    
    // MARK: - actions

    @IBAction func create(_ sender: Any) {
        let controller = UIAlertController(title: "Create",
                                              message: "a brand new fruit",
                                              preferredStyle: .alert)
        controller.addTextField { textField in
            textField.placeholder = "name and emoji"
        }
        
        let ok = UIAlertAction(title: "Ok", style: .default) { _ in
            guard let name = controller.textFields?.first?.text, !name.isEmpty else { return }

            self.fruits.append(Fruit(name: name))
            self.tableView.reloadData()
        }
        controller.addAction(ok)
        
        let cancel = UIAlertAction(title: "Cancel", style: .destructive) { _ in
            
        }
        controller.addAction(cancel)
        
        self.present(controller, animated: true, completion: nil)
    }
    
    @IBAction func menu(_ sender: Any) {

        
        let controller = UIAlertController(title: "Menu",
                                           message: "file operations",
                                           preferredStyle: .actionSheet)
        
        controller.popoverPresentationController?.barButtonItem = sender as? UIBarButtonItem

        let save = UIAlertAction(title: "Save as", style: .default) { _ in
            self.save()
        }
        controller.addAction(save)
        
        let load = UIAlertAction(title: "Load", style: .default) { _ in
            self.load()
        }
        controller.addAction(load)

        let cancel = UIAlertAction(title: "Cancel", style: .destructive) { _ in
            
        }
        controller.addAction(cancel)
        
        self.present(controller, animated: true, completion: nil)
    }

    // MARK: - file operations
    
    func load() {
        let picker = UIDocumentPickerViewController(documentTypes: ["public.json"], in: .open)
        picker.delegate = self
        picker.modalPresentationStyle = .fullScreen
        self.present(picker, animated: true, completion: nil)
    }
    
    func save() {
        let controller = UIAlertController(title: "Name",
                                           message: "your file",
                                           preferredStyle: .alert)
        controller.addTextField { textField in
            textField.placeholder = "file name"
        }
        
        let save = UIAlertAction(title: "Save", style: .default) { _ in
            guard
                let name = controller.textFields?.first?.text,
                !name.isEmpty,
                let url = self.ubiquitousJson(named: name)
            else {
                return
            }
            do {
                let data = try JSONEncoder().encode(self.fruits)
                guard let jsonString = String(data: data, encoding: .utf8) else { return }
                try jsonString.write(to: url, atomically: true, encoding: .utf8)
                try data.write(to: url, options: [.atomic])
            }
            catch {
                print(error.localizedDescription)
            }
        }
        controller.addAction(save)
        
        let cancel = UIAlertAction(title: "Cancel", style: .destructive) { _ in
            
        }
        controller.addAction(cancel)
        
        self.present(controller, animated: true, completion: nil)
    }
}

extension ViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.fruits.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let fruit = self.fruits[indexPath.item]
        cell.textLabel?.text = fruit.name
        return cell
    }
}

extension ViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    func tableView(_ tableView: UITableView,
                   commit editingStyle: UITableViewCell.EditingStyle,
                   forRowAt indexPath: IndexPath) {

        guard editingStyle == .delete else {
            return
        }
        self.fruits.remove(at: indexPath.item)
        tableView.reloadData()
    }
}

extension ViewController: UIDocumentPickerDelegate {

    func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
        guard
            controller.documentPickerMode == .open,
            let url = urls.first,
            url.startAccessingSecurityScopedResource()
        else {
            return
        }
        defer {
            url.stopAccessingSecurityScopedResource()
        }
        do {
            let data = try Data(contentsOf: url)
            self.fruits = try JSONDecoder().decode([Fruit].self, from: data)
            self.tableView.reloadData()
        }
        catch {
            print(error.localizedDescription)
        }
    }
}

