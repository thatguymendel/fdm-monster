# FDM-Monster Development Plan

This file tracks our goals, features, and progress for the custom fork of FDM-Monster (FDMM).  
It will be continuously updated as we implement new features and complete milestones.

---

## Vision

Enhance FDM-Monster from a basic OctoPrint farm manager into a **powerful yet simple tool** for managing printers, filament, and files — with flexible tagging, filament tracking, and smarter printer selection.

---

## Core Features & Goals

### 1. Printer Tagging System
- Each printer remains tied to its OctoPrint instance.
- Add a flexible tagging system:
  - Tags can represent **printer type** (Prusa MK4, Sidewinder X1, Bambu X1C, etc.).
  - Tags can represent **nozzle size/material** (0.4 brass, 0.6 hardened steel).
  - Tags can represent **any custom label** the user wants.
- Ability to **filter/search printers by tags**.
- **Workflow Example**: Find all printers tagged “PLA”, “Black”, “0.4 Nozzle”.

**Status:** Not started

---

### 2. Filament Management
- Each printer always has **one “active” spool** loaded.
- Workflow:
  1. User loads new spool → logs it in FDMM.
  2. User specifies filament type, color, weight (1kg, 2kg, etc.).
  3. After each print, FDMM subtracts filament used (based on slicer’s G-code metadata).
- User can filter/search for printers by:
  - Filament type (e.g. “PLA+”).
  - Filament color.
  - Remaining weight (e.g. “>200g left”).

**Status:** Not started

---

### 3. File Management System
- Centralized G-code storage inside FDMM.
- Ability to add **tags to files** (similar to printers).
- Users can queue prints and assign them to available printers that match tags.
- Potential workflow:
  - Upload G-code → Tag as “PLA Black”, “Big Part” → System suggests compatible printers.

**Status:** Not started

---

### 4. User Interface Improvements
- Retain **floor layout view** (printers laid out like in real life).
- Add **“Tag Search View”** to quickly filter and list printers.
- Add **Filament Management Panel** for viewing/editing loaded spools.
- Add **File Library Page** for tagged G-code browsing.

**Status:** Not started

---

## Technical Considerations

- **Database**:  
  - Currently FDMM uses MongoDB.  
  - Tagging + filament data will require **new schemas/collections**.  
  - We may later experiment with SQLite for simpler deployments.

- **API Changes**:  
  - New endpoints for managing tags.  
  - New endpoints for filament lifecycle (load spool, subtract used, mark empty).  
  - File storage endpoints for uploads, tag assignments, and retrieval.

- **UI**:  
  - Likely React changes in frontend.  
  - Filterable tag-based search component.  
  - New forms for filament entry.

---

## Roadmap / Milestones

1. **Custom Build Setup**
   - [x] Confirm dev environment working.
   - [x] Custom Docker build tested.
   - [ ] CI/CD pipeline for rebuilding images from fork.

2. **Printer Tagging**
   - [ ] Add DB schema changes for tags.
   - [ ] API routes for assigning/removing tags.
   - [ ] Frontend UI for managing and filtering by tags.

3. **Filament Management**
   - [ ] DB schema for filament spools.
   - [ ] API endpoints for load/spool usage updates.
   - [ ] Frontend panel for managing spools.
   - [ ] Auto subtract filament after prints.

4. **File Management**
   - [ ] File storage in FDMM media folder.
   - [ ] Add tagging system for files.
   - [ ] Print queue implementation.

5. **UI Redesign**
   - [ ] Tag Search View.
   - [ ] Filament Panel.
   - [ ] File Library Page.

---

## Notes
- Keep things **modular**: tagging system should be reusable for printers, files, and filament.  
- Start simple → get tags working for printers first.  
- We’ll maintain this plan in GitHub so progress is tracked over time.

