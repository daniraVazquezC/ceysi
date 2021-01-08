class ApplicationRecord < ActiveRecord::Base
  # Comentario: Una clase base abstracta en Rails Model es simplemente un modelo que no es persistente, es decir, no está respaldado por una tabla.
  # El modelo como abstracto le dice a Rails que lo vea como uno que no es persistente y que se usaría para compartir funcionalidad con sus subclases a través de la herencia.
  self.abstract_class = true
end
